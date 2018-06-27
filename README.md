
# Frogger (utilizando `Julia`)
###### Projeto Final da Disciplina de Modelos de Linguagens de Programação (INF/UFRGS) Aplicada pelo [Prof. Dr. Lucas Mello Schnorr](https://github.com/schnorr/). Desenvolvido por [Augusto Timm](https://github.com/augustotimm), [Eduardo Brito](https://github.com/esbrito) e [Lucas Flores](https://github.com/pacluke).
---
Retirado da [página da disciplina](https://github.com/schnorr/mlp/tree/master/projeto):
O objetivo deste trabalho consiste em fornecer aos alunos a oportunidade de **estudar uma linguagem de programação moderna com características híbridas** (i.e., multiparadigma). O trabalho permitirá aos alunos **demonstrarem que aprenderam os princípios de programação relacionados com os diferentes paradigmas** estudados ao longo do semestre, demonstrando, ainda, a **capacidade de analisar e avaliar linguagens de programação, seguindo os critérios abordados em aula**.

## Versão Funcional
Todos os requisitos, com exceção da utilização de *pattern matching* foram atendidos.

### Instruções de uso

A versão de `Julia` utilizado no projeto foi 0.6.2 e está disponível para download no [site da linguagem](https://julialang.org/downloads/).
Após instalar essa versão de `Julia`, é só entrar na pasta `Functional` do projeto e escrever o comando:

    julia --color=yes frogger.jl

O sapo é representado pela letra `W`. Seus inimigos são representados pelo caractere `@`. O jogador ganha 10 pontos toda vez que avança uma linha e morre se encostar em algum inimigo. Ao chegar ao fim do cenário e encostar em uma das posições do caractere `^` o jogador ganha a partida. É possível ficar em cima de troncos `#` para atravessar a água.

Para a movimentação do sapo basta usar as teclas `w`, `a`, `s` e `d`, que o movimentam para cima, esquerda, baixo e direita, respectivamente.
