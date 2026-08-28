// ==========================================================================
//  Fundamentos — 01. Por que existe uma linguagem de marcação
// ==========================================================================

#import "../config/macros.typ": *

== O problema da produção acadêmica

Escrever um trabalho acadêmico é, na prática, *dois trabalhos*: pensar o conteúdo e
brigar com a formatação.

#espaco()

#duas-colunas(
  [
    - a numeração das seções se desfaz ao inserir uma seção nova
    - o sumário fica desatualizado
    - "ver a Figura 5" quando a figura já é a 6
    - cada referência é formatada à mão
  ],
  conceito[
    O problema não é o editor. É o *documento não saber a própria estrutura*: para ele,
    "3.2 Metodologia" é só um texto em negrito.
  ],
)

== Três caminhos, três trocas

#tabela(
  colunas: (auto, 1fr, 1fr, 1fr),
  alinhamento: (left, left, left, left),
  [], [*Editor visual*], [*LaTeX*], [*Typst*],
  [Como se escreve], [clicando], [marcação], [marcação],
  [Quem cuida do layout], [você], [o sistema], [o sistema],
  [Curva de aprendizado], [baixa], [alta], [média],
  [Onde brilha], [texto curto, escrita a várias mãos], [tipografia e matemática, ecossistema maduro], [documento estruturado com retorno rápido],
)

#espaco()

Nenhum dos três é errado. O que muda é *quem paga o custo da formatação* --- e quando.

== O que uma linguagem de marcação muda

#demo(
```typ
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

= Introdução
O sistema de controle é descrito
pela @eq:planta.

$ G(s) = K/(tau s + 1) $ <eq:planta>
```,
[
  #text(weight: "bold", size: 1.1em)[1 Introdução]

  O sistema de controle é descrito pela Equação 1.

  #grid(
    columns: (1fr, auto),
    align: horizon,
    $ G(s) = K/(tau s + 1) $, [(1)],
  )
],
)

#espaco()

O número da seção, o número da equação e a referência cruzada #dest[não foram digitados].
O documento passou a conhecer a própria estrutura.
