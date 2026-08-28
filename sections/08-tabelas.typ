// ==========================================================================
//  Elementos — 08. Tabelas
// ==========================================================================

#import "../config/macros.typ": *

== A tabela mínima

#demo(
  proporcao: (1.2fr, 1fr),
```typ
#table(
  columns: 3,
  table.header(
    [$f$ (Hz)], [$|Z|$ ($Omega$)], [Erro],
  ),
  [100],  [1591,5], [0,68 %],
  [1000], [159,2],  [1,13 %],
)
```,
[
  #table(
    columns: 3,
    inset: 5pt,
    table.header([$f$ (Hz)], [$|Z|$ ($Omega$)], [Erro]),
    [100], [1591,5], [0,68 %],
    [1000], [159,2], [1,13 %],
  )
],
)

#espaco()

As células vêm em sequência; `columns` decide onde a linha quebra. `table.header` marca
o cabeçalho --- e é o que faz o cabeçalho *repetir* quando a tabela vira a página.

== Largura e alinhamento das colunas

#duas-colunas(
  proporcao: (1.1fr, 1fr),
  codigo[
```typ
#table(
  columns: (auto, 1fr, 4em),
  align: (left, left, right),
  ...
)
```
  ],
  [
    / `auto`: ajusta ao conteúdo
    / `1fr`: divide o espaço que sobra
    / medida fixa: `4em`, `3cm`, `20%`

    #espaco()
    `align` aceita um valor por coluna. Número alinhado à direita, texto à esquerda.
  ],
)

== Tabela é dado; grid é layout

#duas-colunas(
  conceito[
    `#table` gera *semântica de tabela*: entra na lista de tabelas, pode ser
    referenciado e é lido como tabela por leitor de tela.
  ],
  alerta[
    Para posicionar dois blocos lado a lado, use `#grid`. Tabela usada como layout
    polui a lista de tabelas e atrapalha a acessibilidade.
  ],
)

#espaco()

As duas funções têm a *mesma sintaxe*. A escolha é semântica, não visual: pergunte se
aquilo é um dado ou um arranjo.

== A tabela no trabalho acadêmico

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  codigo[
```typ
#figure(
  table(columns: 3, ..),
  caption: [Impedância medida.],
  kind: table,
) <tab:impedancia>

#outline(target:
  figure.where(kind: table))
```
  ],
  [
    Envolver em `figure` dá numeração, entrada na *lista de tabelas* e referência por
    `@tab:impedancia`.

    #espaco()
    #alerta[
      Legenda de tabela vai *acima*; a fonte, abaixo. Quem rege o formato da tabela não
      é a ABNT --- é a norma de apresentação tabular do IBGE, que a NBR 14724
      referencia. Voltamos a isso na seção de ABNT.
    ]
  ],
)

== Antes de seguir

#desafio[
  Monte a tabela de resultados de um ensaio com três colunas (grandeza, valor teórico,
  valor medido), alinhe os números à direita, envolva em `figure` com legenda e
  referencie no texto.
]
