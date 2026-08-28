// ==========================================================================
//  Galeria de componentes
//
//  Não faz parte da apresentação. Serve para ver todos os tipos de slide e
//  todos os componentes de conteúdo lado a lado, ao alterar o tema.
//
//  Compile com:
//      typst compile --root . examples/galeria.typ build/galeria.pdf
// ==========================================================================

#import "../config/global.typ": apresentacao, slide-titulo, slide-topicos, slide-estrutural
#import "../config/macros.typ": *

#show: apresentacao

#slide-titulo()
#slide-topicos()

= Componentes

== Caixas

#duas-colunas(
  {
    conceito[
      *Conceito.* Definição, regra ou ideia central. Borda em `primary`.
    ]
    espaco()
    alerta[
      *Alerta.* Armadilha ou erro comum. Borda em `accentdark`.
    ]
  },
  {
    saida[
      *Saída.* Simula a página do PDF gerado, quando o resultado não pode ser
      renderizado dentro do slide.
    ]
    espaco()
    desafio[
      Crie uma seção e insira uma figura com legenda.
    ]
  },
)

== Código com realce nativo

#codigo(titulo: "artigo.typ")[
```typ
#set page(paper: "a4", margin: 3cm)
#set text(font: "Libertinus Serif", size: 12pt, lang: "pt")
#set heading(numbering: "1.1")

= Introdução
O texto começa aqui, com uma citação @nilsson2015.
```
]

== Comparação: o que o aluno já conhece à esquerda

#comparacao(
```latex
\section{Introdução}
\textbf{negrito} e \emph{itálico}

\begin{itemize}
  \item primeiro
\end{itemize}
```,
```typ
= Introdução
*negrito* e _itálico_

- primeiro
```,
)

== Código e resultado lado a lado

#demo(
```typ
$ Z(omega) = R + j omega L $
```,
[
  $ Z(omega) = R + j omega L $
],
)

== Equação e tabela

#equacao[
  $ Z(omega) = R + j (omega L - 1/(omega C)) $
]

#tabela(
  colunas: (auto, 1fr, auto, auto),
  alinhamento: (left, left, center, right),
  [Símbolo], [Grandeza], [Unidade], [Medido],
  [$R$], [Resistência], [$Omega$], [98,4],
  [$L$], [Indutância], [mH], [9,87],
  [$C$], [Capacitância], [μF], [1,02],
)

== Citação e ficha de pacote

#duas-colunas(
  citacao(
    [O Typst não precisa ser um substituto universal do LaTeX: basta ser uma
     alternativa moderna para determinados fluxos acadêmicos.],
    autor: [nota de aula],
  ),
  pacote(
    "touying",
    versao: "0.7.4",
    resolve: [slides a partir de headings, contagem n/N, animações],
    usar: [quando a apresentação precisa de estrutura e navegação],
    evitar: [em 5 slides estáticos — `#set page` puro basta],
    limite: [traz a dependência transitiva `uniwarn`],
  ),
  proporcao: (1fr, 1.1fr),
)

== Figura com legenda e crédito

#figura(
  image("/assets/logos/ifma.png", width: 100%),
  legenda: [Figura 1 --- Marca do Instituto Federal do Maranhão.],
  fonte: [Fonte: IFMA, 2026.],
  largura: 18%,
)

== Destaques em linha

Um termo #dest[importante] no meio do texto, e uma função como #cmd[`#outline()`]
ou um arquivo como #cmd[`config/theme.typ`].

#alerta[
  Aqui mora uma armadilha real do Typst, que derrubou a primeira versão desta
  galeria: dentro de `[...]` o `#outline()` é *executado*, não impresso — e o
  título "Sumário" que ele gera virou uma seção fantasma no slide de tópicos.
  Para mostrar código em linha, use crase.
]

#slide-estrutural[Referências]

#v(1fr)
#text(size: 0.85em)[
  TYPST GMBH. *Typst Documentation*. Disponível em:
  #link("https://typst.app/docs/"). Acesso em: 27 ago. 2026.
]
#v(1fr)
