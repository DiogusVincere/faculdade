# Back-end

Exercícios de JavaScript com Node.js (2024-2). Cada pasta tem o enunciado no README e um arquivo `.js` por exercício; rode com `node arquivo.js`.

- `2024-2/aula02-basico` — `back-end02.js`: 15 exercícios de variáveis, tipos, template strings, escopo (`var`/`let`), condicionais e cálculos (média, área, resistência, salário, IMC).
- `2024-2/aula03-strings-funcoes` — `back-end03.js`: 15 exercícios de strings, conversão de tipos, operadores lógicos e funções (saudação, maior de idade, palíndromo, maior de três, potência).
- `2024-2/aula05-poo` — `1.js` a `7.js`: classes, herança e métodos (Carro, Pessoa, Automovel/Carro/Moto/Caminhao, Máquinas/Furadeira, conta bancária).
- `2024-2/aula06-arrays-objetos` — `1.js` a `18.js`: arrays (push, shift, índices) e objetos (livro, propriedades dinâmicas, avaliação).

## Observações da revisão
- aula05, `3.js`: a classe mãe se chamava `Automóvel`, mas `Moto` e `Caminhao` estendiam `Automovel` (sem acento) e o arquivo quebrava; renomeada para `Automovel`. As chamadas `ligar_motor()`/`desligar_motor()` passaram a `ligarMotor()`/`desligarMotor()`, que são os métodos definidos, e `vidro_aberto` virou `vidroAberto`, o atributo do construtor.
- aula06, `4.js`: a fila da clínica removia com `pop(0)`, `pop(1)` e `pop(2)`; `pop` ignora o argumento e tira sempre o último. Trocado por `shift()`, que remove da frente, como numa fila.
