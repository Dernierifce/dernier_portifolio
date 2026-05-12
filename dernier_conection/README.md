# Dernier Portfolio

Portfólio pessoal de Dernier Bruno, construído com React, Vite e Tailwind CSS.

## Visão Geral

O projeto é um site de apresentação com navegação suave, seções de serviços, trabalhos, contato e alternância de tema claro/escuro.

## Estrutura

```text
dernier_portifolio/
├── dist/
├── public/
├── src/
│   ├── components/
│   ├── App.jsx
│   ├── index.css
│   └── main.jsx
├── index.html
├── package.json
└── vite.config.js
```

## Requisitos

- Node.js 18+
- npm

## Recuperar acesso ao localhost (check automatico)

Se voce perdeu acesso ao `http://localhost:5173/`, use o script de diagnostico:

```powershell
Set-Location "g:\Meu Drive\dernier_conection\dernier_conection\dernier_conection"
powershell -ExecutionPolicy Bypass -File .\scripts\dev-check.ps1 -AutoInstall -RunDev -DevHost localhost -Port 5173
```

O script faz checks automaticos de:

- Presenca de `node` e `npm` no PATH.
- Versao minima do Node.js (18+).
- Existencia de `package.json`.
- Instalacao de dependencias (`npm ci`) com `-AutoInstall`.
- Disponibilidade da porta 5173.

Tambem e possivel rodar apenas diagnostico sem abrir o servidor:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev-check.ps1 -AutoInstall
```

E usar atalhos via `npm`:

```powershell
npm run doctor
npm run dev:doctor
```

Checks opcionais adicionais:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev-check.ps1 -AutoInstall -CheckLint -CheckBuild
```

## Executar localmente

1. Instale as dependências:

```bash
npm install
```

2. Inicie o servidor de desenvolvimento:

```bash
npm run dev -- --host 0.0.0.0
```

3. Abra no navegador:

```text
http://localhost:5173/
```

## Build

```bash
npm run build
```

## Deploy

O projeto já inclui os scripts necessários para publicação com `gh-pages`.

```bash
npm run deploy
```

## CI / Deploy automático

O repositório contém um workflow do GitHub Actions que executa `npm ci` e `npm run build` dentro da pasta `dernier_conection` e publica o conteúdo de `dernier_conection/dist` no GitHub Pages automaticamente quando houver push no branch `main`.

Se você remover o diretório `dist` localmente, o rebuild será disparado automaticamente no próximo push para `main` (ou você pode executar o workflow manualmente na aba "Actions" do GitHub).

## Repositório

- GitHub: https://github.com/Dernierifce/dernier_portifolio
- Issues: https://github.com/Dernierifce/dernier_portifolio/issues

## Autor

Dernier Bruno
