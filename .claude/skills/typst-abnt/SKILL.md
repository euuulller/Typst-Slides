---
name: typst-abnt
description: Normas ABNT para trabalhos acadêmicos e como atendê-las em Typst — NBR 14724, 6023, 6024, 6027, 6028, 6034 e 10520; citação autor-data e numérica; formatação de referências; e a distinção obrigatória entre norma, interpretação da norma, requisito institucional e decisão estética do template. Use ao afirmar qualquer exigência normativa, ao escrever os slides de ABNT, ao configurar citações e bibliografia, e ao avaliar template ou pacote que se diga "ABNT". NÃO use para estrutura genérica de documento (typst-academico), sintaxe (typst-core) ou layout de slide (typst-slides).
when_to_use: "a ABNT exige...", citação e referência bibliográfica, NBR 14724/6023/10520, avaliar template ABNT, configurar bibliography style
---

# ABNT em Typst

## Regra dura desta skill

**Nunca invente regra ABNT.** Toda afirmação normativa cai em uma destas quatro caixas, e o
texto do slide precisa deixar claro em qual:

| Caixa | Como escrever |
|---|---|
| **Norma** | "A NBR 6023 rege a elaboração das referências." — só com a NBR nomeada |
| **Interpretação** | "É prática corrente aplicar isso assim…" |
| **Requisito institucional** | "O IFMA exige…" — e diga que é da instituição, não da ABNT |
| **Decisão estética** | "Este template escolheu…" — não passe por exigência |

As NBR são documentos pagos e não estão neste repositório. Se você não consegue apontar
onde a exigência está escrita, **não a apresente como norma**: apresente como prática
corrente, ou pesquise antes. Registre o que confirmar em `references/abnt/`.

## O fato mais importante para esta aula

O Typst **já traz o estilo ABNT embutido no compilador** — verificado no binário 0.15.1
desta máquina:

```typ
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

Nenhum pacote, nenhum download, nenhum `.csl` avulso. É o argumento central do capítulo:
a parte mais chata da ABNT — formatar cada referência — sai de graça.

Isso cobre **referências e citações**. **Não** cobre capa, folha de rosto, margens, sumário
nem numeração de seções: essas continuam sendo trabalho de template.

## O que cada norma rege

Escopo — verificável pelo título público de cada norma:

| Norma | Rege |
|---|---|
| **NBR 14724** | Trabalhos acadêmicos: estrutura e apresentação (capa, folha de rosto, ordem dos elementos) |
| **NBR 6023** | Referências: elaboração |
| **NBR 6024** | Numeração progressiva das seções |
| **NBR 6027** | Sumário |
| **NBR 6028** | Resumo |
| **NBR 6034** | Índice |
| **NBR 10520** | Citações em documentos |
| **NBR 15287** | Projeto de pesquisa |
| **IBGE, Normas de apresentação tabular** | Tabelas — **não é ABNT**, e é o que a NBR 14724 referencia |

O último item é uma boa pergunta de aula: "quem manda no formato da tabela?" A resposta não
é a ABNT.

## As quatro camadas — não confundir

Este é o núcleo conceitual do capítulo:

```
Typst      = linguagem + compilador + ecossistema
Package    = funcionalidade reutilizável
Template   = estrutura e estilo prontos
ABNT       = conjunto de normas
Instituição= exigências adicionais do curso/departamento/biblioteca
```

Consequências que o aluno precisa levar: *usar Typst* não é *estar em ABNT*; um pacote
chamado "abnt" **não é a norma**, é a leitura que o autor dele fez da norma; e o template do
seu curso pode exigir coisas que a ABNT não pede. Quando template e instituição divergem,
**quem assina o trabalho é a instituição**.

## Citação — as duas famílias

A NBR 10520 admite sistema **autor-data** e sistema **numérico**. Não misture os dois no
mesmo trabalho.

```typ
// autor-data (mais comum no Brasil)
#set cite(style: "associacao-brasileira-de-normas-tecnicas")

Segundo #cite(<nilsson2015>, form: "prose"), a impedância ...   // no texto
A impedância é função da frequência @nilsson2015.               // entre parênteses
```

`form: "prose"` produz a citação integrada à frase; a forma padrão vai entre parênteses.
Citação direta longa tem tratamento próprio de recuo e corpo — trate como formatação de
template e verifique a exigência antes de afirmar valores.

## Avaliando um template ou pacote "ABNT"

Antes de recomendar qualquer um, verifique, nesta ordem:

1. **Versão e data** — todos os pacotes ABNT do Universe hoje estão abaixo de 1.0.
2. **Qual norma ele diz seguir**, e se cita a NBR ou só "ABNT".
3. **Compatibilidade** com o compilador 0.15.1.
4. **Se é template ou package** — template você inicia com `typst init`, package você importa.
5. **Se a instituição do aluno aceita** — nenhum template do Universe é oficial do IFMA.

Recomendação honesta para a aula: mostre que o estilo ABNT nativo resolve referências, e que
para capa/folha de rosto o caminho mais seguro é **o template da própria instituição** ou um
template próprio, não um pacote de terceiro tratado como autoridade normativa.

## Ver também

`normas.md`: o que cada NBR cobre em detalhe, o que é verificável, o que é prática corrente
e a lista de pontos que precisam de confirmação antes de virar slide.
