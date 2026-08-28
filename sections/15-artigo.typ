// ==========================================================================
//  Prática — 15. O artigo acadêmico completo
// ==========================================================================
//  O artigo mostrado aqui existe, compila e está em examples/artigo/.
// ==========================================================================

#import "../config/macros.typ": *

== O projeto final

#duas-colunas(
  proporcao: (1fr, 1.1fr),
  codigo(titulo: "examples/artigo/")[
```
artigo.typ        só conteúdo
config.typ        só aparência
referencias.bib   só fontes
```
  ],
  conceito[
    Três arquivos, três responsabilidades. Trocar o template do curso é editar
    `config.typ`; o texto do artigo não é tocado.
  ],
)

#espaco()

É a mesma separação que esta apresentação usa --- e a mesma que você viu na seção de
`set` e `show`.

== O template em uma linha

#codigo(titulo: "artigo.typ")[
```typ
#import "config.typ": artigo, fonte, ABNT

#show: artigo.with(
  titulo: [Modelagem da impedância de um circuito RLC série],
  autores: ([Euller dos Santos Rodrigues Duarte],),
  instituicao: [Instituto Federal do Maranhão --- Campus Imperatriz],
  resumo: [...], palavras-chave: ([circuito RLC], [impedância]),
  abstract: [...], keywords: ([RLC circuit], [impedance]),
)

= Introdução
```
]

#espaco()

Depois desta linha, o arquivo tem *apenas texto e estrutura*.

== O que o artigo demonstra

#duas-colunas(
  [
    - título, autores e instituição
    - resumo e palavras-chave
    - _abstract_ e _keywords_
    - seções e subseções numeradas
    - equações numeradas
    - figura com legenda e fonte
  ],
  [
    - tabela com legenda e fonte
    - referência cruzada a equação, figura e tabela
    - citação no padrão autor-data
    - referências em ABNT nativo
    - apêndice fora da numeração
    - paginação automática
  ],
)

#espaco()

#conceito[
  Doze elementos de um trabalho acadêmico, três páginas, *zero pacotes externos*.
]

== O resultado

#duas-colunas(
  proporcao: (1fr, 1.15fr),
  saida[
    #set text(size: 0.85em)
    *1 INTRODUÇÃO*

    A análise de circuitos em regime permanente senoidal é a base do estudo de sistemas
    elétricos lineares (NILSSON; RIEDEL, 2019).

    #v(0.4em)
    *2 FUNDAMENTAÇÃO TEÓRICA*

    #align(center)[$ Z(omega) = R + j (omega L - 1/(omega C)) $ #h(1fr) (1)]

    O termo real da Equação 1 é a resistência.
  ],
  [
    Seção em caixa alta, citação autor-data, equação numerada à direita e referência
    cruzada --- tudo gerado.

    #espaco()
    #alerta[
      Os valores da tabela do artigo foram *calculados* a partir do modelo, não medidos.
      Dado ilustrativo apresentado como resultado experimental é falta grave.
    ]
  ],
)

== Antes de seguir

#desafio[
  Compile o artigo com
  `typst compile --root . examples/artigo/artigo.typ artigo.pdf`, troque o título e o
  autor, acrescente uma seção e uma figura sua, e insira uma referência no `.bib`.
]
