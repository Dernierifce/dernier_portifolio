param(
    [switch]$AutoInstall,
    [switch]$RunDev,
    [switch]$CheckBuild,
    [switch]$CheckLint,
    [string]$DevHost = "localhost",
    [int]$Port = 5173
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param(
        [string]$Label,
        [string]$Message
    )
    Write-Host ("[{0}] {1}" -f $Label, $Message)
}

$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $projectRoot

Write-Status "INFO" "Projeto: $projectRoot"
Write-Status "INFO" "Iniciando checks automatizados..."

$failures = @()

$nodeCmd = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodeCmd) {
    $failures += "Node.js nao encontrado no PATH."
} else {
    $nodeVersionRaw = (node -v).Trim()
    $nodeVersionNumber = $nodeVersionRaw.TrimStart("v")
    Write-Status "OK" "Node detectado: $nodeVersionRaw"

    try {
        $nodeVersion = [version]$nodeVersionNumber
        if ($nodeVersion.Major -lt 18) {
            $failures += "Node.js 18+ necessario. Versao atual: $nodeVersionRaw"
        }
    } catch {
        $failures += "Nao foi possivel interpretar a versao do Node: $nodeVersionRaw"
    }
}

$npmCmd = Get-Command npm -ErrorAction SilentlyContinue
if (-not $npmCmd) {
    $failures += "npm nao encontrado no PATH."
} else {
    $npmVersionRaw = (npm -v).Trim()
    Write-Status "OK" "npm detectado: $npmVersionRaw"
}

if (-not (Test-Path -LiteralPath "package.json")) {
    $failures += "package.json nao encontrado na pasta do projeto."
}

if ($failures.Count -gt 0) {
    Write-Status "ERROR" "Falha nos pre-requisitos:"
    foreach ($failure in $failures) {
        Write-Host " - $failure"
    }
    Write-Host ""
    Write-Host "Instale Node.js LTS e reabra o terminal."
    Write-Host "Windows (winget): winget install OpenJS.NodeJS"
    exit 1
}

$nodeModulesExists = Test-Path -LiteralPath "node_modules"
if (-not $nodeModulesExists) {
    if ($AutoInstall) {
        Write-Status "INFO" "node_modules nao encontrado. Executando npm ci..."
        npm ci
        if ($LASTEXITCODE -ne 0) {
            Write-Status "ERROR" "npm ci falhou."
            exit 1
        }
        Write-Status "OK" "Dependencias instaladas com sucesso."
    } else {
        Write-Status "WARN" "node_modules nao encontrado. Rode com -AutoInstall para instalar automaticamente."
    }
} else {
    Write-Status "OK" "Dependencias ja instaladas (node_modules presente)."
}

$portInUse = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($portInUse) {
    $pids = ($portInUse | Select-Object -ExpandProperty OwningProcess -Unique) -join ", "
    Write-Status "WARN" "Porta $Port ja esta em uso. PID(s): $pids"
} else {
    Write-Status "OK" "Porta $Port livre para uso."
}

if ($CheckLint) {
    Write-Status "INFO" "Executando lint..."
    npm run lint
    if ($LASTEXITCODE -ne 0) {
        Write-Status "ERROR" "Lint falhou."
        exit 1
    }
    Write-Status "OK" "Lint concluido sem erros."
}

if ($CheckBuild) {
    Write-Status "INFO" "Executando build..."
    npm run build
    if ($LASTEXITCODE -ne 0) {
        Write-Status "ERROR" "Build falhou."
        exit 1
    }
    Write-Status "OK" "Build concluido com sucesso."
}

if ($RunDev) {
    Write-Status "INFO" "Iniciando servidor Vite em http://$DevHost`:$Port ..."
    npm run dev -- --host $DevHost --port $Port
    exit $LASTEXITCODE
}

Write-Status "OK" "Checks concluidos."
Write-Host ""
Write-Host "Para iniciar o servidor agora:"
Write-Host ("  powershell -ExecutionPolicy Bypass -File .\scripts\dev-check.ps1 -AutoInstall -RunDev -DevHost {0} -Port {1}" -f $DevHost, $Port)
