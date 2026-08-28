// ==========================================================================
//  Sintaxe — 05. set, show e a configuração do documento
// ==========================================================================

#import "../config/macros.typ": *

== `set`: mudar o padrão

#duas-colunas(
  proporcao: (1.1fr, 1fr),
  codigo[
```typ
#set page(paper: "a4", margin: 3cm)
#set text(font: "Libertinus Serif",
          size: 12pt, lang: "pt")
#set par(justify: true,
         first-line-indent: 1.25cm)
#set heading(numbering: "1.1")
```
  ],
  conceito[
    `set` define o *padrão* de uma função dali até o fim do bloco atual. Escrito no topo
    do arquivo, vale para o documento inteiro.
  ],
)

#espaco()

Cinco linhas resolvem papel, fonte, idioma, justificação, recuo de parágrafo e numeração.
É o preâmbulo inteiro de um trabalho acadêmico.

== `show`: transformar

#duas-colunas(
  codigo[
```typ
// muda o estilo do que casa
#show heading: set text(fill: navy)

// recebe o elemento e devolve outro
#show heading: it => block[#it.body]

// aplica um template ao resto do documento
#show: artigo.with(titulo: "Ensaio RLC")
```
  ],
  [
    #conceito[
      `set` muda *como uma função se comporta*. \
      `show` muda *o que aparece no lugar de um elemento*.
    ]
    #espaco()
    A terceira forma é a que carrega um template inteiro em uma linha.
  ],
)

== `set` e `show` na prática

#demo(
  proporcao: (1.1fr, 1fr),
```typ
#show "RLC": strong

O circuito RLC série tem
frequência de ressonância
$ f_0 = 1/(2 pi sqrt(L C)) $
```,
[
  O circuito #text(weight: "bold")[RLC] série tem frequência de ressonância

  $ f_0 = 1/(2 pi sqrt(L C)) $
],
)

#espaco()

`show` também casa com *texto literal*. Útil para padronizar uma sigla no trabalho
inteiro sem caçar ocorrência por ocorrência.

== Onde a configuração deve morar

#alerta[
  Configuração espalhada pelo meio do texto é a maior fonte de documento inconsistente.
  Se o mesmo `set` aparece duas vezes, ele está no lugar errado.
]

#espaco()

#duas-colunas(
  [
    *Regra prática*
    - todo `set` global no topo, ou em um arquivo só
    - ajuste local, e só ele, junto do trecho
    - repetiu? vira template
  ],
  codigo(titulo: "artigo.typ")[
```typ
#import "config.typ": artigo
#show: artigo

= Introdução
```
  ],
)

== Ênfase, código e escape

#demo(
  proporcao: (1fr, 1fr),
```typ
*negrito*, _itálico_, `código`,
#underline[sublinhado],
H#sub[2]O e 10#super[3].

Cifrão literal: \$ e til: \~
```,
[
  *negrito*, _itálico_, `código`, #underline[sublinhado], H#sub[2]O e 10#super[3].

  Cifrão literal: \$ e til: \~
],
)

#espaco()

A contrabarra escapa qualquer caractere especial. É o que salva quando o texto precisa
de `$`, `#`, `*` ou `_` literais.
