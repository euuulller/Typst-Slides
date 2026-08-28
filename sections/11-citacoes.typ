// ==========================================================================
//  ABNT — 11. Citações
// ==========================================================================
//  As saídas foram compiladas. Ver examples/abnt/referencias-demo.typ.
// ==========================================================================

#import "../config/macros.typ": *

== Citar é referenciar

#demo(
  proporcao: (1.1fr, 1fr),
```typ
A análise segue @nilsson2019.

#cite(<cormen2022>, form: "prose")
demonstra o teorema mestre.
```,
[
  A análise segue (NILSSON; RIEDEL, 2019).

  Cormen _et al._ (2022) demonstra o teorema mestre.
],
)

#espaco()

A mesma chave do `.bib` serve para citar. `form: "prose"` integra a citação à frase; a
forma padrão vai entre parênteses. *Citar uma obra já a inclui nas referências* --- e só
as citadas entram.

== Autor-data ou numérico

#duas-colunas(
  conceito[
    A *NBR 10520* admite os dois sistemas: autor-data e numérico. Escolha um e mantenha
    no trabalho inteiro.
  ],
  alerta[
    Misturar os dois no mesmo trabalho é inconsistência formal.

    É *prática corrente* que, no sistema numérico, a lista de referências siga a ordem de
    citação em vez da alfabética --- confira no manual do seu curso.
  ],
)

#espaco()

No Typst, trocar de sistema é trocar o `style:` --- o texto não muda.

== O que o compilador não decide

#tabela(
  colunas: (auto, 1fr),
  alinhamento: (left, left),
  [*Camada*], [*Exemplo*],
  [Norma ABNT], [a NBR 10520 rege a apresentação de citações],
  [Prática corrente], [citação longa com recuo e corpo menor],
  [Requisito institucional], [o manual do curso pede algo a mais],
  [Decisão do template], [quanto de recuo, qual corpo exatamente],
)

#espaco()

#alerta[
  Valores como "recuo de 4 cm" e "corpo 10" circulam em todo manual de TCC, mas *não os
  apresente como exigência* sem conferir a norma. Confira no manual do seu curso.
]

== A citação longa é um bloco

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  codigo[
```typ
#let citacao-longa(corpo) = block(
  inset: (left: 4cm),   // valor do
  text(size: 10pt)[     // template
    #set par(justify: true,
             first-line-indent: 0pt)
    #corpo
  ],
)
```
  ],
  [
    Uma função, definida uma vez, aplicada sempre igual.

    #espaco()
    #conceito[
      Se a instituição exigir outro recuo, muda-se *uma linha* --- e todas as citações
      longas do trabalho acompanham.
    ]
  ],
)
