# Web

Front-end de 2024-1 (HTML, CSS e JavaScript) e 2024-2 (Vue 2). Tudo roda abrindo o HTML no navegador, sem build.

- `2024-1/simopi-dashboard` — SIMOPI, dashboard de produção industrial do Projeto Integrador: `index.html` (dashboard com ApexCharts), `pecas.html` e `equipe.html`; estilos em `css/`, script em `js/`, imagens em `images/`.
- `2024-1/painel-vip` — Painel VIP (Visão Integrada de Produção): gráfico de linhas da produção diária, gráfico de barras de eficiência, tabelas de estoque e de status, com Bootstrap 4 e Chart.js 4.
- `2024-2/vue-exercicios` — `ex1` (contador), `ex2` (mostrar/ocultar texto), `ex3` (lista dinâmica) e `contador-2`, com Vue 2.7 pelo CDN.

## Observações da revisão
- simopi-dashboard: os HTML já apontavam para `css/`, `js/` e `images/`, mas os arquivos estavam na raiz; foram movidos. `/images/blob.jpeg` virou caminho relativo. `teste.html` era cópia idêntica de `equipe.html` e era o alvo do link "Dashboard" (agora `index.html`); `percas.css`, `large.png` e `vscode.png` não eram usados e saíram. O README veio do clone `projeto_integrador`, corrigindo "Chart.js" para ApexCharts, que é o que `scripts.js` usa. `index.html` continua com a barra lateral em inglês e links `#` (era o modelo seguido na aula).
- painel-vip: as âncoras `#production` e `#inventory` não existiam e passaram a apontar para as tabelas (`#currentProductionStatusTable` e `#rawMaterialStockTable`); `logo.png` não está no repositório e a tag saiu do cabeçalho; Chart.js fixado em `4.4.1` (o CDN sem versão entregava sempre a última).
- vue-exercicios: `<%= BASE_URL %>` é placeholder do vue-cli e não funciona em página solta; removido. Vue fixado em `2.7.16`. `contador-2.html` era um componente `.vue` colado num HTML e foi reescrito como página que roda sozinha.
