// ==========================================================================
//  Sintaxe — 04. Estrutura do documento
// ==========================================================================

#import "../config/macros.typ": *

== O documento é uma árvore

#demo(
  proporcao: (1fr, 1fr),
```typ
#set heading(numbering: "1.1")

= Metodologia
== Bancada de ensaio
=== Instrumentação
== Procedimento
= Resultados
```,
[
  #text(weight: "bold", size: 1.1em)[1 Metodologia] \
  #h(0.8em) #text(weight: "bold")[1.1 Bancada de ensaio] \
  #h(1.6em) #text(weight: "bold", size: 0.95em)[1.1.1 Instrumentação] \
  #h(0.8em) #text(weight: "bold")[1.2 Procedimento] \
  #text(weight: "bold", size: 1.1em)[2 Resultados]
],
)

#espaco()

Um `=` a mais desce um nível. A numeração vem de #cmd[`#set heading(numbering: "1.1")`] ---
nenhum número é digitado.

== Por que a árvore importa

#conceito[
  Sumário, lista de figuras, referência cruzada e navegação do PDF são todos *derivados
  da mesma árvore*. Marcar a estrutura uma vez paga em quatro lugares.
]

#espaco()

#duas-colunas(
  codigo[
```typ
#outline()
#outline(title: [Lista de figuras],
         target: figure.where(kind: image))
```
  ],
  alerta[
    Negrito não é título. `*Metodologia*` fica igual na tela e some do sumário: o
    documento não sabe que aquilo é uma seção.
  ],
)

== Rótulo e referência cruzada

#demo(
  proporcao: (1.15fr, 1fr),
```typ
#set heading(numbering: "1.1")

= Resultados <sec:resultados>

Os ensaios da @sec:resultados
confirmam o modelo.
```,
[
  #text(weight: "bold", size: 1.1em)[3 Resultados]

  Os ensaios da Seção 3 confirmam o modelo.
],
)

#espaco()

O rótulo `<nome>` vem *depois* do elemento; `@nome` o referencia. Se a seção virar a 4,
o texto acompanha.

== Antes de seguir

#desafio[
  Monte um arquivo com três seções e duas subseções, ligue a numeração, acrescente um
  `#outline()` no topo e uma referência cruzada a uma das seções.
]
