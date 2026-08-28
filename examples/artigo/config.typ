// ==========================================================================
//  config.typ — o template do artigo
//
//  Tudo o que é APARÊNCIA mora aqui. artigo.typ só tem conteúdo.
//  É a mesma separação que a apresentação defende: um ponto de verdade.
//
//  AVISO sobre os valores de formatação abaixo (margens, corpo, entrelinhas,
//  recuo de citação longa): eles seguem a PRÁTICA CORRENTE dos manuais de
//  trabalho acadêmico brasileiros. Não são reprodução de texto normativo.
//  Confira as exigências do seu curso antes de entregar.
// ==========================================================================

#let ABNT = "associacao-brasileira-de-normas-tecnicas"

// ---- auxiliares ----
// Definidos ANTES de `artigo`: uma função captura o escopo no momento em que
// é definida, então um `#let` que aparece depois não existe para ela.

// Seção primária em caixa alta é prática corrente em muitos manuais.
// Isolada aqui para ser fácil de desligar se o seu curso não pedir.
#let titulo-de-secao(it) = if it.level == 1 {
  strong(upper(it))
} else {
  strong(it)
}

// Citação direta longa. O recuo de 4 cm e o corpo 10 são PRÁTICA CORRENTE.
#let citacao-longa(corpo) = block(
  inset: (left: 4cm),
  above: 1em,
  below: 1em,
)[
  #set par(justify: true, first-line-indent: 0pt, leading: 0.65em)
  #set text(size: 10pt)
  #corpo
]

// Fonte/crédito de figura ou tabela.
#let fonte(x) = align(center, text(size: 10pt)[Fonte: #x])

#let artigo(
  titulo: none,
  autores: (),
  instituicao: none,
  resumo: none,
  palavras-chave: (),
  abstract: none,
  keywords: (),
  corpo,
) = {
  // ---- página e tipografia ----
  set page(
    paper: "a4",
    margin: (top: 3cm, left: 3cm, bottom: 2cm, right: 2cm),
    numbering: "1",
    number-align: top + right,
  )
  set text(font: "Libertinus Serif", size: 12pt, lang: "pt", region: "br")
  set par(justify: true, first-line-indent: 1.25cm, leading: 0.9em)
  set heading(numbering: "1.1")

  // ---- títulos de seção ----
  show heading: it => {
    set text(size: if it.level == 1 { 12pt } else { 12pt })
    set block(above: 1.4em, below: 0.9em)
    titulo-de-secao(it)
  }

  // ---- figuras: legenda acima, fonte abaixo ----
  show figure.caption: it => {
    set text(size: 10pt)
    it
  }
  set figure(gap: 0.6em)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: top)

  // ---- equações numeradas ----
  set math.equation(numbering: "(1)")

  // ---- elementos pré-textuais ----
  align(center)[
    #text(size: 14pt, weight: "bold")[#titulo]
    #v(1.2em)
    #text(size: 11pt)[#autores.join("; ")]
    #linebreak()
    #text(size: 10pt, style: "italic")[#instituicao]
  ]
  v(1.6em)

  // Resumo: parágrafo único, sem recuo de primeira linha.
  block(inset: (x: 0.6cm))[
    #set par(first-line-indent: 0pt, justify: true)
    #set text(size: 11pt)
    *Resumo* --- #resumo

    #v(0.5em)
    *Palavras-chave:* #palavras-chave.join("; ").
  ]
  v(1em)

  block(inset: (x: 0.6cm))[
    #set par(first-line-indent: 0pt, justify: true)
    #set text(size: 11pt, lang: "en")
    *Abstract* --- #abstract

    #v(0.5em)
    *Keywords:* #keywords.join("; ").
  ]
  v(1.6em)

  corpo
}
