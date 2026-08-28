// ==========================================================================
//  Sintaxe — 06. Listas
// ==========================================================================

#import "../config/macros.typ": *

== Três tipos de lista

#demo(
  proporcao: (1fr, 1fr),
```typ
- fonte regulada
- multímetro digital

+ montar o circuito
+ medir a tensão

/ Impedância: oposição total
  à corrente alternada
/ Reatância: parcela devida
  a indutor e capacitor
```,
[
  - fonte regulada
  - multímetro digital

  + montar o circuito
  + medir a tensão

  / Impedância: oposição total à corrente alternada
  / Reatância: parcela devida a indutor e capacitor
],
)

#espaco()

`-` marcador, `+` numeração automática, `/` lista de termos --- esta última é a que
resolve glossário e lista de símbolos.

== Aninhamento e numeração

#demo(
  proporcao: (1.1fr, 1fr),
```typ
#set enum(numbering: "1.a)")

+ Ensaio em vazio
  + medir tensão
  + medir corrente
+ Ensaio em curto
```,
[
  #set enum(numbering: "1.a)")
  + Ensaio em vazio
    + medir tensão
    + medir corrente
  + Ensaio em curto
],
)

#espaco()

A indentação define o nível. O padrão `"1.a)"` numera o primeiro nível com algarismos e
o segundo com letras --- e vale para o documento inteiro.

== Listas em slide: a regra da densidade

#duas-colunas(
  alerta[
    Lista não é resumo do que você vai falar. Se o slide tem oito itens, ele tem oito
    slides dentro --- ou nenhum conteúdo.
  ],
  conceito[
    Limites deste material: no máximo *8 linhas de texto*, *2 níveis* de lista e
    *12 linhas de código* por slide.
  ],
)

#espaco()

#desafio[
  Escreva a lista de materiais de um experimento com `-`, o procedimento com `+` e três
  definições com `/`. Depois troque a numeração do procedimento para `"I."`.
]
