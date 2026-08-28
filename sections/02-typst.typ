// ==========================================================================
//  Fundamentos — 02. O que é Typst e como funciona
// ==========================================================================

#import "../config/macros.typ": *

== O que é Typst

#conceito[
  Um *sistema de composição tipográfica baseado em marcação*: você escreve texto com
  marcas de estrutura, e um compilador produz o PDF.
]

#espaco()

#duas-colunas(
  [
    - escrito em *Rust*, código aberto sob *Apache-2.0*
    - primeira versão pública em *março de 2023*
    - versão usada nesta aula: *0.15.1*
  ],
  alerta[
    "Typst" nomeia três coisas: a *linguagem*, o *compilador* e o *ecossistema* de
    pacotes. Confundi-las gera boa parte das dúvidas de iniciante.
  ],
)

== Como o Typst funciona

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  [
    #codigo(titulo: "no terminal")[
```bash
typst compile artigo.typ artigo.pdf
typst watch   artigo.typ artigo.pdf
```
    ]
    #espaco()
    Uma invocação resolve *referências cruzadas, sumário e bibliografia*. Não há segunda
    passagem nem programa auxiliar para a bibliografia.
  ],
  [
    #saida[
      `artigo.typ` \
      #h(1em) ↓ #h(0.4em) _compilador_ \
      `artigo.pdf`
    ]
    #espaco()
    #cmd[typst watch] recompila a cada vez que você salva: o PDF ao lado acompanha a
    escrita.
  ],
)

== Instalação e ambiente

#duas-colunas(
  [
    *Instalar o compilador*
    #codigo[
```bash
winget install Typst.Typst   # Windows
brew   install typst         # macOS
cargo  install --locked typst-cli
```
    ]
    Conferir: #cmd[typst --version]
  ],
  [
    *Sem instalar nada* \
    `typst.app` compila no navegador, com edição colaborativa.

    #espaco()
    *No editor* \
    A extensão *Tinymist* dá realce, erros em tempo real e pré-visualização --- em VS
    Code, Neovim, Emacs, Helix e Zed.
  ],
)

#espaco()

#desafio[
  Instale o compilador e confirme a versão com `typst --version`.
]
