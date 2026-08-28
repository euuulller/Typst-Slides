# Esqueletos de trabalhos acadêmicos

Arquivo de apoio da skill `typst-academico`. Código para ser adaptado, não copiado cego.
A conformidade normativa de cada elemento é assunto da skill `typst-abnt`.

---

## 1. Ordem dos elementos por tipo de trabalho

`O` = obrigatório na prática corrente · `Op` = opcional · `—` = não se aplica.
Coluna "Norma" indica onde a exigência é tratada (ver skill `typst-abnt`).

| Elemento | Artigo | Relatório | TCC / Monografia | Dissertação / Tese | Norma |
|---|---|---|---|---|---|
| Capa | Op | O | O | O | NBR 14724 |
| Folha de rosto | — | O | O | O | NBR 14724 |
| Ficha catalográfica | — | Op | Op | O | biblioteca da instituição |
| Folha de aprovação | — | — | O | O | NBR 14724 |
| Dedicatória / agradecimentos / epígrafe | — | Op | Op | Op | NBR 14724 |
| Resumo em português | O | O | O | O | NBR 6028 |
| Abstract | O | Op | O | O | NBR 6028 |
| Listas de figuras/tabelas/símbolos | — | Op | Op | O | NBR 14724 |
| Sumário | Op | O | O | O | NBR 6027 |
| Introdução | O | O | O | O | — |
| Desenvolvimento | O | O | O | O | NBR 6024 |
| Conclusão | O | O | O | O | — |
| Referências | O | O | O | O | NBR 6023 |
| Glossário | Op | Op | Op | Op | — |
| Apêndice (do autor) | Op | Op | Op | Op | NBR 14724 |
| Anexo (de terceiro) | Op | Op | Op | Op | NBR 14724 |

---

## 2. Artigo — esqueleto completo

```typ
// ---------- configuração ----------
#set page(paper: "a4", margin: (top: 3cm, left: 3cm, bottom: 2cm, right: 2cm))
#set text(font: "Libertinus Serif", size: 12pt, lang: "pt", region: "br")
#set par(justify: true, first-line-indent: 1.25cm, leading: 0.65em)
#set heading(numbering: "1.1")

// legenda acima em tabela, abaixo em figura
#show figure.where(kind: table): set figure.caption(position: top)

// ---------- pré-textual ----------
#align(center)[
  #text(size: 14pt, weight: "bold")[
    Modelagem de impedância em circuitos RLC série
  ]
  #v(1.2em)
  #text(size: 11pt)[
    Nome do Autor \
    Instituto Federal do Maranhão --- Campus Imperatriz \
    #link("mailto:autor@exemplo.br")
  ]
]
#v(2em)

#par(first-line-indent: 0pt)[
  *Resumo* --- Parágrafo único, sem recuo, entre 100 e 250 palavras, com objetivo,
  método, resultado e conclusão.

  *Palavras-chave:* impedância; circuito RLC; resposta em frequência.
]
#v(1.5em)

// ---------- textual ----------
= Introdução
Texto com citação @nilsson2015 e referência à @eq:impedancia.

= Materiais e métodos

== Montagem experimental

$ Z(omega) = R + j (omega L - 1/(omega C)) $ <eq:impedancia>

#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    table.header([Componente], [Valor nominal], [Medido]),
    [$R$], [$100 " " Omega$], [$98.4 " " Omega$],
    [$L$], [$10 " " "mH"$],   [$9.87 " " "mH"$],
    [$C$], [$1 " " mu "F"$],  [$1.02 " " mu "F"$],
  ),
  caption: [Componentes do circuito ensaiado.],
) <tab:componentes>

= Resultados e discussão
Os valores da @tab:componentes ...

= Conclusão

// ---------- pós-textual ----------
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

---

## 3. TCC / Monografia — pré-textuais e pós-textuais

```typ
// ---- Capa ----
#page(numbering: none)[
  #set align(center)
  #image("figuras/logos/ifma.png", height: 3cm)
  #v(1fr)
  INSTITUTO FEDERAL DO MARANHÃO \
  CAMPUS IMPERATRIZ
  #v(2fr)
  #text(size: 14pt, weight: "bold")[TÍTULO DO TRABALHO]
  #v(3fr)
  IMPERATRIZ \ 2026
]

// ---- Folha de rosto ----
#page(numbering: none)[
  #set align(center)
  NOME COMPLETO DO AUTOR
  #v(3fr)
  #text(size: 14pt, weight: "bold")[TÍTULO DO TRABALHO]
  #v(1fr)
  // nota de apresentação: recuada à direita, corpo menor
  #align(right, box(width: 8cm)[
    #set align(left)
    #set text(size: 10pt)
    #set par(justify: true, first-line-indent: 0pt)
    Trabalho de Conclusão de Curso apresentado ao Curso de
    Engenharia Elétrica do IFMA --- Campus Imperatriz, como
    requisito parcial à obtenção do título de Engenheiro
    Eletricista.

    Orientador: Prof. Dr. Nome do Orientador.
  ])
  #v(3fr)
  IMPERATRIZ \ 2026
]

// ---- Resumo ----
#heading(numbering: none, outlined: false)[RESUMO]
#par(first-line-indent: 0pt)[Texto do resumo.]
#v(1em)
*Palavras-chave:* termo um; termo dois; termo três.

// ---- Listas e sumário ----
#outline(title: [LISTA DE FIGURAS], target: figure.where(kind: image))
#outline(title: [LISTA DE TABELAS], target: figure.where(kind: table))
#outline(title: [SUMÁRIO], depth: 3, indent: auto)

// ---- Pós-textual ----
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")

#heading(numbering: none)[APÊNDICE A --- Código-fonte do ensaio]
#heading(numbering: none)[ANEXO A --- Folha de dados do sensor]
```

Detalhes que costumam passar batido:

- `outlined: false` tira o elemento do sumário (correto para o próprio resumo).
- `numbering: none` no `heading` evita que resumo e apêndices entrem na numeração das seções.
- Contagem de páginas começa na capa, mas o número só **aparece** a partir do textual:
  `#set page(numbering: none)` no pré-textual e `#counter(page).update(n)` ao iniciar o
  textual — ou `#set page(numbering: "1")` com o contador já ajustado.

---

## 4. Relatório técnico de laboratório

Estrutura enxuta, útil para as disciplinas experimentais:

```
1 Objetivo
2 Fundamentação teórica      (equações + referências)
3 Materiais e métodos        (lista de equipamentos + procedimento)
4 Resultados                 (tabelas + gráficos)
5 Análise e discussão        (comparação medido × teórico, erro percentual)
6 Conclusão
  Referências
  Apêndice: memorial de cálculo
```

Padrão de tabela de resultados com erro:

```typ
#figure(
  table(
    columns: 4,
    align: (center, center, center, center),
    table.header([$f$ (Hz)], [$|Z|$ teórico ($Omega$)],
                 [$|Z|$ medido ($Omega$)], [Erro (%)]),
    [100],  [1591.5], [1602.3], [0.68],
    [1000], [159.2],  [161.0],  [1.13],
  ),
  caption: [Impedância em função da frequência.],
) <tab:impedancia>
```

---

## 5. Listas, glossário e índice

| Elemento | Como fazer |
|---|---|
| Lista de figuras | `#outline(target: figure.where(kind: image))` |
| Lista de tabelas | `#outline(target: figure.where(kind: table))` |
| Lista de equações | `#outline(target: math.equation)` |
| Sumário com profundidade | `#outline(depth: 3)` |
| Glossário / lista de siglas | pacote `glossarium` (ver skill `typst-pacotes`) |
| Índice remissivo | não há solução nativa madura; avaliar pacote ou omitir |

---

## 6. Modularização — o `main.typ` mínimo

```typ
#import "config/template.typ": trabalho
#show: trabalho.with(
  titulo: "Modelagem de impedância em circuitos RLC série",
  autor: "Nome do Autor",
  orientador: "Prof. Dr. Nome",
  curso: "Engenharia Elétrica",
  ano: 2026,
)

#include "capitulos/01-introducao.typ"
#include "capitulos/02-fundamentacao.typ"
#include "capitulos/03-metodologia.typ"
#include "capitulos/04-resultados.typ"
#include "capitulos/05-conclusao.typ"

#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

`#include` renderiza o conteúdo do arquivo no ponto onde aparece. `#import` traz apenas
símbolos (funções, variáveis) — é o que se usa para o template e as macros.

Vantagem a demonstrar em aula: trocar o template inteiro é editar **uma linha** de
`main.typ`; nenhum capítulo é tocado.
