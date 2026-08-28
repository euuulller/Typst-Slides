// ==========================================================================
//  Elementos — 09. Matemática
// ==========================================================================

#import "../config/macros.typ": *

== Em linha e em bloco

#demo(
  proporcao: (1.15fr, 1fr),
```typ
A reatância $X_L = omega L$ cresce
com a frequência:

$ Z = R + j (omega L - 1/(omega C)) $
```,
[
  A reatância $X_L = omega L$ cresce com a frequência:

  $ Z = R + j (omega L - 1/(omega C)) $
],
)

#espaco()

`$x$` fica na linha; `$ x $`, *com espaço junto aos cifrões*, vira bloco centralizado.
Um espaço decide o layout.

== Símbolos têm nome

#duas-colunas(
  codigo[
```typ
$ alpha, beta, omega, Omega $
$ sum_(i=1)^n x_i $
$ integral_0^oo e^(-s t) dif t $
$ nabla times bold(E) $
$ x arrow.r y, a <= b, c != d $
```
  ],
  conceito[
    Nada de contrabarra: o símbolo é escrito pelo *nome*. `sum`, `integral`, `omega`,
    `arrow.r`. O editor completa enquanto você digita.
  ],
)

== As quatro armadilhas

#tabela(
  colunas: (auto, 1fr, 1fr),
  alinhamento: (left, left, left),
  [*Intenção*], [*Errado*], [*Certo*],
  [Palavra dentro da fórmula], [`$ganho = 2$`], [`$"ganho" = 2$`],
  [Variável de várias letras], [`$Vout$`], [`$V_"out"$`],
  [Subscrito composto], [`$x_i+1$`], [`$x_(i+1)$`],
  [Multiplicação], [`$2x$`], [`$2 x$`],
)

#espaco()

Identificador de uma letra é variável; de várias letras, o Typst procura um *símbolo*
com aquele nome. Daí a necessidade das aspas.

== Numerar e referenciar

#demo(
  proporcao: (1.15fr, 1fr),
```typ
#set math.equation(numbering: "(1)")

$ H(s) = K/(tau s + 1) $ <eq:planta>

A @eq:planta descreve a planta
de primeira ordem.
```,
[
  #set math.equation(numbering: "(1)")
  $ H(s) = K/(tau s + 1) $

  A Equação (1) descreve a planta de primeira ordem.
],
)

#espaco()

Mesma mecânica das figuras: rótulo depois do elemento, `@` no texto, numeração gerada.

== Dois cursos, a mesma notação

#duas-colunas(
  [
    *Engenharia Elétrica*
    #codigo[
```typ
$ mat(V_1; V_2) = mat(
  Z_11, Z_12;
  Z_21, Z_22
) mat(I_1; I_2) $
```
    ]
  ],
  [
    *Ciência da Computação*
    #codigo[
```typ
$ T(n) = 2 T(n/2) + O(n)
  => T(n) = O(n log n) $
```
    ]
  ],
)

#espaco()

#desafio[
  Escreva a equação da frequência de ressonância $f_0 = 1/(2 pi sqrt(L C))$, numere-a e
  referencie no texto. Depois escreva uma matriz $2 times 2$.
]
