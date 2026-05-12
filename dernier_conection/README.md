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

Observação: se estiver usando o diretório sincronizado por Google Drive, `npm install` pode falhar devido a travamentos do sistema de arquivos. Nesse caso prefira rodar os comandos em uma pasta local ou deixe o build acontecer no GitHub Actions (a workflow já está configurada).

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

Observação: já existe uma Actions configurada para construir e publicar o diretório `dernier_conection` como Pages (base `'/dernier_portifolio/'`). Após o push, verifique a aba Pages no repositório para confirmar o domínio e aguarde a ação finalizar.

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

---

Links úteis:

- Repositório: https://github.com/Dernierifce/dernier_portifolio
- Site (dev): http://localhost:5173/

Se quiser, posso também atualizar o README raiz do repositório com um sumário e link para este README interno.
