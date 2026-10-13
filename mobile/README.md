# Mobile

Disciplinas de desenvolvimento mobile com Flutter e Dart: 2025-1 (3º semestre) e 2025-2 (4º semestre).
Os apps são projetos Flutter padrão: `flutter pub get` e `flutter run` dentro da pasta do app.

## 2025-1
- `aula03-dart-basico` — dez exercícios de Dart no console (`dart ex1.dart` etc.): área de triângulo, salário líquido, conversão para euro e outros cálculos com entrada do usuário.
- `aula07-conttech` — app ContTech: contador e campo de nome com saudação.
- `aula09-navegacao` — navegação por rotas nomeadas: home, informações pessoais, jogadores e notas do aluno (média e situação).
- `aula12-exercicios` — menu com dois exercícios: galeria de comidas típicas (imagens em `assets/`) e formulário de usuário (nome, idade, sexo, estado civil).
- `sensores-mqtt` — Monitor Industrial 4.0: assina `industrial/sensores/#` no broker público `broker.emqx.io` e mostra temperatura e umidade em medidores (`mqtt_client`, `syncfusion_flutter_gauges`).

## 2025-2
- `aula03-shared-preferences` — formulário (nome, idade, endereço, RG) salvo no aparelho com `shared_preferences`.
- `aula05-sqflite-crud` — CRUD de alunos em SQLite local (`sqflite`, com `sqflite_common_ffi` para desktop).
- `aula06` — cadastro de cães (`pets.db`) com DAO e banco singleton (`sqflite`).

## extras (pasta da turma MOBILE-TURMA-A, sem histórico)
Semestre inferido pela numeração das aulas: `aulaNN` sem sufixo é do 3º semestre (2025-1); `4sm` é do 4º (2025-2).
- `aula02-4sm-responsivo` (2025-2) — layout responsivo por breakpoints (mobile, tablet, desktop) com tela de calculadora de soma.
- `aula03-4sm-shared-preferences` (2025-2) — lista de nomes salva com SharedPreferences; outra versão da aula 03, diferente de `2025-2/aula03-shared-preferences`.
- `aula04` — projeto padrão do Flutter (contador), usado para testar a configuração do ambiente.
- `aula06-delivery-app` (2025-2) — app de delivery: splash, restaurantes, categorias, pratos e sacola com Provider (dados em `assets/data.json`).
- `aula08` — três apps de layout com vários filhos (Stack, lista de usuários, campo de mensagem).
- `aula09` — campo de texto (nome e idade) e tela de login com validação.
- `aula09-4sm` (2025-2) — loja: app Flutter (`appaula09`) que consome a API REST de produtos em `backend-django` (Django + Django REST Framework, `/api/produtos/`).
- `aula10` — App Agro IoT: dashboard com menu e cards (temperatura do solo).
- `aula11` — checkbox, radio button e tela de chat com bolhas de mensagem.
- `aula13` — splash animada e consumo de API com `http`.
- `aula14` — App Ecommerce: login, cadastro de usuário e de produtos, lista e exclusão via API.
- `flutter_application_1` — projeto padrão do Flutter (contador).
- `flutter_hotel` — S&M Hotel: login, cadastro, destinos, cálculo de diárias e checkout com Provider.

## Observações da revisão
- `2025-1/aula12-exercicios`: `assets:` estava fora de `flutter:` no `pubspec.yaml`, e o Flutter não empacotava as imagens; corrigido.
- `2025-1/aula07-conttech`: a saudação só mudava quando a tela era reconstruída por outro motivo; entrou `onChanged` no campo de nome.
- `2025-2/aula05-sqflite-crud`: a pasta `.idea/` estava versionada e saiu do índice.
- `extras/aula09-4sm` e `extras/aula14`: o endereço da API está fixo no código (IP da rede da aula); troque pelo seu. No backend, a `SECRET_KEY` vem de `os.environ.get("SECRET_KEY", "dev-only")`; `db.sqlite3` e `__pycache__` não foram trazidos (rode `python manage.py migrate`).
- `extras/aula11`: `appaula09` e `appconttech` eram submódulos apontando para outros repositórios e não têm conteúdo aqui.
