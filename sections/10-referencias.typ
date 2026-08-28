// ==========================================================================
//  ABNT — 10. Referências e bibliografia
// ==========================================================================
//  As saídas mostradas aqui foram COMPILADAS, não descritas de memória.
//  Ver examples/abnt/referencias-demo.typ.
// ==========================================================================

#import "../config/macros.typ": *

== Uma bibliografia central

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  codigo(titulo: "referencias.bib")[
```bib
@book{nilsson2019,
  author    = {Nilsson, James W. and
               Riedel, Susan A.},
  title     = {Electric Circuits},
  edition   = {11},
  publisher = {Pearson},
  address   = {Harlow},
  year      = {2019},
}
```
  ],
  [
    #codigo(titulo: "artigo.typ")[
```typ
#bibliography("referencias.bib")
```
    ]
    #espaco()
    Um arquivo com os dados brutos, uma linha no documento. A formatação de cada entrada
    deixa de ser trabalho seu.
  ],
)

== O estilo ABNT já vem no compilador

#conceito[
  `#bibliography(..., style: "associacao-brasileira-de-normas-tecnicas")` \
  Nenhum pacote, nenhum download, nenhum arquivo `.csl` avulso.
]

#espaco()

#duas-colunas(
  proporcao: (1.3fr, 1fr),
  codigo[
```typ
#bibliography(
  "referencias.bib",
  style: "associacao-brasileira-de-normas-tecnicas",
)
```
  ],
  saida[
    #set text(size: 0.85em)
    CORMEN, Thomas H. _et al_. *Introduction to Algorithms*. 4. ed. Cambridge: MIT
    Press, 2022.

    NILSSON, James W.; RIEDEL, Susan A. *Electric Circuits*. 11. ed. Harlow: Pearson,
    2019.

    SHANNON, Claude E. A Mathematical Theory of Communication. *Bell System Technical
    Journal*, v. 27, n. 3, p. 379--423, 1948.
  ],
)

== Fonte online: use `@online`

#duas-colunas(
  proporcao: (1fr, 1.05fr),
  codigo[
```bib
@online{typstdocs,
  author  = {{Typst GmbH}},
  title   = {Typst Documentation},
  year    = {2026},
  url     = {https://typst.app/docs/},
  urldate = {2026-08-28},
}
```
  ],
  [
    #saida[
      #set text(size: 0.85em)
      TYPST GMBH. *Typst Documentation*. Disponível em: \<https://typst.app/docs/\>.
      Acesso em: 28 ago. 2026.
    ]
    #espaco()
    #alerta[
      `@misc` com `howpublished` *perde a URL* e deixa uma vírgula solta. Verificado
      neste compilador.
    ]
  ],
)

== Antes de seguir

#duas-colunas(
  [
    Também é aceito o formato nativo do Typst, o *Hayagriva* (`.yml`), mais legível que
    BibTeX. Na prática o `.bib` vence: é o que o Google Acadêmico, o Zotero e o
    Mendeley exportam.
  ],
  desafio[
    Monte um `.bib` com três obras que você realmente usou, aplique o estilo ABNT e
    confira a ordenação alfabética.
  ],
)
