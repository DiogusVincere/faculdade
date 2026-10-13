# faculdade

Exercícios e protótipos de Mobile, Back-end, Web e IA, organizados por disciplina e semestre.

Cada disciplina tem um README com a lista dos projetos e as observações da revisão:
[mobile](mobile/README.md) · [ia](ia/README.md) · [back-end](back-end/README.md) · [web](web/README.md) · [iot](iot/README.md).

## Mobile (Flutter e Dart)

| Pasta | Semestre | O que faz | Tecnologias |
|---|---|---|---|
| [mobile/2025-1/aula03-dart-basico](mobile/2025-1/aula03-dart-basico) | 2025-1 | Dez exercícios de Dart no console: área, salário líquido, conversão para euro e outros cálculos com entrada do usuário | Dart (dart:io) |
| [mobile/2025-1/aula07-conttech](mobile/2025-1/aula07-conttech) | 2025-1 | App ContTech: contador e campo de nome com saudação | Flutter |
| [mobile/2025-1/aula09-navegacao](mobile/2025-1/aula09-navegacao) | 2025-1 | Navegação por rotas nomeadas: home, informações pessoais, jogadores e notas do aluno (média e situação) | Flutter |
| [mobile/2025-1/aula12-exercicios](mobile/2025-1/aula12-exercicios) | 2025-1 | Menu com dois exercícios: galeria de comidas típicas (imagens em assets) e formulário de usuário | Flutter |
| [mobile/2025-1/sensores-mqtt](mobile/2025-1/sensores-mqtt) | 2025-1 | Monitor Industrial 4.0: assina `industrial/sensores/#` no broker público EMQX e mostra temperatura e umidade em medidores | Flutter, mqtt_client, syncfusion_flutter_gauges |
| [mobile/2025-2/aula03-shared-preferences](mobile/2025-2/aula03-shared-preferences) | 2025-2 | Formulário (nome, idade, endereço, RG) salvo no aparelho | Flutter, shared_preferences |
| [mobile/2025-2/aula05-sqflite-crud](mobile/2025-2/aula05-sqflite-crud) | 2025-2 | CRUD de alunos em banco SQLite local | Flutter, sqflite |
| [mobile/2025-2/aula06](mobile/2025-2/aula06) | 2025-2 | Cadastro de cães (pets.db) com DAO e banco singleton | Flutter, sqflite |
| [mobile/extras](mobile/extras) | 2025-1 e 2025-2 | Treze projetos avulsos da pasta da turma: layouts, login, chat, e-commerce com API Django, hotel e delivery (lista em [mobile/README.md](mobile/README.md)) | Flutter, http, provider, Django REST Framework |

## IA e Big Data

| Pasta | Semestre | O que faz | Tecnologias |
|---|---|---|---|
| [ia/2024-2/aula02-pandas](ia/2024-2/aula02-pandas) | 2024-2 | Exercícios de DataFrame: criação a partir de dicionários, índices e seleção de dados | Python, pandas |
| [ia/2024-2/aula05-regressao-linear](ia/2024-2/aula05-regressao-linear) | 2024-2 | Regressão linear simples em cinco cenários (vazão × nível, quantidade × temperatura, área × valor, gastos × renda, demanda × consumo) e gráficos | Python, scikit-learn, pandas, seaborn |
| [ia/2024-2/aula06-arvore-decisao](ia/2024-2/aula06-arvore-decisao) | 2024-2 | Cinco classificadores por árvore de decisão (ex.: máquina precisa de manutenção) com acurácia, matriz de confusão e `plot_tree` | Python, scikit-learn |
| [ia/2024-2/aula08-svm](ia/2024-2/aula08-svm) | 2024-2 | SVM linear em quatro problemas: máquina defeituosa, consumo de energia, pH × concentração e forma de pagamento (`dadosclientes.csv`) | Python, scikit-learn, seaborn |
| [ia/2025-1/aula04-chatbot-groq](ia/2025-1/aula04-chatbot-groq) | 2025-1 | Três chatbots com interface Gradio; dois usam a API da Groq (chave pela variável de ambiente `GROQ_API_KEY`) | Python, Gradio, Groq |

## Back-end

| Pasta | Semestre | O que faz | Tecnologias |
|---|---|---|---|
| [back-end/2024-2/aula02-basico](back-end/2024-2/aula02-basico) | 2024-2 | 15 exercícios de variáveis, tipos, template strings, escopo, condicionais e cálculos (média, IMC, salário, energia) | Node.js |
| [back-end/2024-2/aula03-strings-funcoes](back-end/2024-2/aula03-strings-funcoes) | 2024-2 | 15 exercícios de strings, conversão de tipos, operadores lógicos e funções (palíndromo, maior de três, potência) | Node.js |
| [back-end/2024-2/aula05-poo](back-end/2024-2/aula05-poo) | 2024-2 | Classes e herança: Carro, Pessoa, Automovel/Carro/Moto/Caminhao, Máquinas/Furadeira e conta bancária | Node.js |
| [back-end/2024-2/aula06-arrays-objetos](back-end/2024-2/aula06-arrays-objetos) | 2024-2 | 18 exercícios de arrays (push, shift, índices) e objetos (livro, propriedades dinâmicas) | Node.js |

## Web

| Pasta | Semestre | O que faz | Tecnologias |
|---|---|---|---|
| [web/2024-1/simopi-dashboard](web/2024-1/simopi-dashboard) | 2024-1 | SIMOPI: dashboard de produção industrial (Projeto Integrador) com páginas de peças e equipe | HTML, CSS, JavaScript, ApexCharts |
| [web/2024-1/painel-vip](web/2024-1/painel-vip) | 2024-1 | Painel VIP (Visão Integrada de Produção): gráficos de produção diária e eficiência, tabelas de estoque e de status | HTML, CSS, Bootstrap 4, Chart.js 4 |
| [web/2024-2/vue-exercicios](web/2024-2/vue-exercicios) | 2024-2 | Quatro páginas com Vue 2: contador, mostrar/ocultar texto e lista dinâmica | HTML, Vue 2.7 |

## IoT

| Pasta | Semestre | O que faz | Tecnologias |
|---|---|---|---|
| [iot/2025-1/domotica-vue-arduino](iot/2025-1/domotica-vue-arduino) | 2025-1 | Domótica: painel web de ambientes e dispositivos lidos do Contentful, mais firmware de ESP32 (simulado no Wokwi) que consulta o mesmo conteúdo | Vue 3, TypeScript, Vite, Pinia, Vue Router, Axios, Contentful, Arduino/ESP32 |

## Como este repositório foi montado

- Dezenove repositórios de aula entraram com `git subtree add`, então o histórico de cada um está preservado; o commit "Importa X em Y (com histórico)" marca a entrada de cada um.
- Três pastas vieram só com os arquivos, sem histórico, porque os repositórios de origem tinham segredos nos commits: `ia/2025-1/aula04-chatbot-groq` (chave da API Groq), `iot/2025-1/domotica-vue-arduino` (tokens do Contentful no `.env` e no firmware) e `mobile/extras` (SECRET_KEY do Django e banco `db.sqlite3`). Nas cópias, os segredos foram trocados por variáveis de ambiente ou marcadores.
- Pequenas correções apontadas numa revisão foram aplicadas num commit próprio ("Aplica as correções apontadas na revisão"). Os notebooks de IA ficaram como entregues; as observações sobre eles estão em [ia/README.md](ia/README.md).
- Licença MIT ([LICENSE](LICENSE)).
