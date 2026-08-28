// ==========================================================================
//  Fundamentos — 03. O primeiro documento e os três modos
// ==========================================================================

#import "../config/macros.typ": *

== O primeiro documento

#demo(
  proporcao: (1fr, 1fr),
```typ
= Relatório de ensaio

A tensão medida foi de 12,04 V, com
erro de _0,3 %_ em relação ao valor
*nominal*.

== Materiais
- fonte regulada
- multímetro digital
```,
[
  #text(weight: "bold", size: 1.15em)[1 Relatório de ensaio]

  A tensão medida foi de 12,04 V, com erro de _0,3 %_ em relação ao valor *nominal*.

  #text(weight: "bold")[1.1 Materiais]
  - fonte regulada
  - multímetro digital
],
)

#espaco()

Um arquivo `.typ`, nenhum preâmbulo, nenhum pacote. `=` é seção, `==` é subseção,
`*` é negrito, `_` é itálico, `-` é item de lista.

== A comparação que interessa

#comparacao(
```latex
\documentclass{article}
\begin{document}
\section{Introdução}
\textbf{negrito} e \emph{itálico}
\begin{itemize}
  \item primeiro item
\end{itemize}
\end{document}
```,
```typ
= Introdução
*negrito* e _itálico_
- primeiro item
```,
)

#espaco()

Mesma saída. A diferença não é elegância: é *quanto do arquivo fala do conteúdo* e
quanto fala do sistema.

== Os três modos

#tabela(
  colunas: (auto, auto, 1fr),
  alinhamento: (left, left, left),
  [*Modo*], [*Entra com*], [*Serve para*],
  [Marcação], [é o padrão do arquivo], [escrever texto],
  [Código], [`#` ou `{ }`], [chamar funções, calcular, decidir],
  [Matemática], [`$ ... $`], [notação matemática],
)

#espaco()

#duas-colunas(
  codigo[
```typ
Texto normal, #emph[com ênfase],
e #calc.pow(2, 10) calculado.

$ P = V I cos(phi) $
```
  ],
  alerta[
    O `#` só existe *na marcação*. Dentro do modo de código você já está em código:
    escrever `#foo` ali é erro.
  ],
)

== Antes de seguir

#desafio[
  Crie `primeiro.typ` com uma seção, uma subseção, uma lista de três itens e uma
  palavra em negrito. Compile com `typst compile primeiro.typ` e abra o PDF.
]

#espaco()

#conceito[
  Se isso funcionou, o resto da aula é acrescentar recursos a este mesmo arquivo:
  figuras, tabelas, equações, referências e, por fim, a ABNT.
]
