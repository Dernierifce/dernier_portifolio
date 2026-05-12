# Dernier Portfolio

Portfólio pessoal desenvolvido com React e Vite.

## Tecnologias

- React
- Vite
- Tailwind CSS
- Lenis

## Como rodar localmente

1. Clone o repositório:

```bash
git clone https://github.com/Dernierifce/dernier_portifolio.git
```

2. Entre na pasta do projeto:

```bash
cd dernier_portifolio
```

3. Instale as dependências:

```bash
npm install
```

4. Inicie o servidor de desenvolvimento:

```bash
npm run dev -- --host 0.0.0.0
```

5. Abra no navegador:

```text
http://localhost:5173/
```

## Build de produção

```bash
npm run build
```

## Deploy no GitHub Pages

1. Instale a dependência de deploy, se ainda não tiver:

```bash
npm install --save-dev gh-pages
```

2. Adicione os scripts abaixo no arquivo `package.json` do projeto:

```json
"scripts": {
	"dev": "vite",
	"build": "vite build",
	"preview": "vite preview",
	"predeploy": "npm run build",
	"deploy": "gh-pages -d dist"
}
```

3. Execute o deploy:

```bash
npm run deploy
```

4. No GitHub, ative o Pages apontando para a branch `gh-pages`.

## Estrutura

```text
dernier_portifolio/
├── index.html
├── package.json
├── public/
└── src/
```

## Autor

Dernier Bruno
