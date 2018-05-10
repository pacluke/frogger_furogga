
# Frogger (utilizando `Julia`)
###### Projeto Final da Disciplina de Modelos de Linguagens de Programação (INF/UFRGS).
---
Retirado da [página da disciplina](https://github.com/schnorr/mlp/tree/master/projeto):
O objetivo deste trabalho consiste em fornecer aos alunos a oportunidade de **estudar uma linguagem de programação moderna com características híbridas** (i.e., multiparadigma). O trabalho permitirá aos alunos **demonstrarem que aprenderam os princípios de programação relacionados com os diferentes paradigmas** estudados ao longo do semestre, demonstrando, ainda, a **capacidade de analisar e avaliar linguagens de programação, seguindo os critérios abordados em aula**.

## Versão Funcional
Todos os requisitos, com exceção da utilização de *pattern matching* foram atendidos.

### Instruções de uso

A versão de `Julia` utilizado no projeto foi 0.6.2 e está disponível para donwload no [site da linguagem](https://julialang.org/downloads/).
Após instalar essa versão de `Julia`, é só entrar na pasta `Functional` do projeto e escrever o comando:

    julia --color=yes frogger.jl

O sapo é representado pela letra `W`. Seus inimigos são representados pelo caractere `@` e pela letra `X`. O jogador ganha 10 pontos toda vez que avança uma linha e morre se encostar em algum inimigo. Nosso sapo sabe nadar, portanto ele pode passar pela água. Ao chegar ao fim do cenário e encostar em uma das posições do caractere `^` o jogador ganha a partida.

### Estado do projeto funcional
| Funções Implementas | Explicitamente Pura?  | Observações |
| ------------ | ------------ | ------------ |
| `function change_tile(y)` | SIM |  |
| `function replace_matrix(fun, ch)` | SIM |  |
| `function eval_things(value01)` | SIM |  |
| `function game_over()` | NÃO |  |
| `function next_stage()` | NÃO | Essa função deveria passar o jogador para o próximo mapa, mas temos apenas uma fase. |
| `function check_for_colisions(m, x, y)` | NÃO |  |
| `function move_frog(m, left, right, up, down) ` | NÃO |  |
| `function clear()` | NÃO |  |
| `function print_map_rec(map, j, sizej, i, sizei)` | NÃO |  |
