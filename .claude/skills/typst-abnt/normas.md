# ABNT — o que é norma, o que é prática, o que falta confirmar

Arquivo de apoio da skill `typst-abnt`.

**Aviso que rege o arquivo inteiro:** as NBR são documentos pagos e **não estão neste
repositório**. Nada aqui reproduz o texto normativo. O que segue separa (a) o escopo de cada
norma, que é público e verificável pelo título, de (b) a prática corrente nas instituições
brasileiras, que é amplamente difundida mas **não deve ser apresentada como exigência sem
confirmação**.

Ao confirmar um item, mova-o para a coluna certa e registre a fonte em
`references/abnt/fontes.md` com data de consulta.

---

## 1. Escopo das normas (verificável)

| Norma | Título / escopo |
|---|---|
| NBR 14724 | Informação e documentação — Trabalhos acadêmicos — Apresentação |
| NBR 6023 | Informação e documentação — Referências — Elaboração |
| NBR 6024 | Informação e documentação — Numeração progressiva das seções de um documento |
| NBR 6027 | Informação e documentação — Sumário — Apresentação |
| NBR 6028 | Informação e documentação — Resumo, resenha e recensão — Apresentação |
| NBR 6034 | Informação e documentação — Índice — Apresentação |
| NBR 10520 | Informação e documentação — Citações em documentos — Apresentação |
| NBR 15287 | Informação e documentação — Projeto de pesquisa — Apresentação |
| NBR 10719 | Informação e documentação — Relatório técnico e/ou científico — Apresentação |

Fora da ABNT, mas referenciado por ela para tabelas:
**IBGE — Normas de apresentação tabular**, 3ª ed., 1993. Disponível gratuitamente no site do
IBGE. É a fonte de regras como "toda tabela tem título e fonte" e "tabela não é fechada
lateralmente".

---

## 2. Prática corrente — a confirmar antes de virar slide

Itens abaixo circulam em todo manual de TCC brasileiro e são o que os templates
implementam. Trate-os como **prática corrente**, não como citação de norma, enquanto não
houver confirmação registrada.

| Item | Prática corrente | Status |
|---|---|---|
| Margens | superior 3 cm, esquerda 3 cm, inferior 2 cm, direita 2 cm | a confirmar |
| Fonte | tamanho 12 no corpo; 10 em citação longa, notas e legendas | a confirmar |
| Entrelinhas | 1,5 no corpo; simples em citação longa, notas, resumo e referências | a confirmar |
| Recuo de citação longa | 4 cm da margem esquerda | a confirmar |
| Limiar de citação longa | mais de 3 linhas | a confirmar |
| Paginação | contada da folha de rosto, impressa a partir do textual, canto superior direito | a confirmar |
| Título de seção primária | inicia em nova página | a confirmar |
| Numeração de seção | até a quinária; sem ponto no fim; alinhada à esquerda | NBR 6024 |
| Resumo | parágrafo único, sem recuo; palavras-chave separadas por ponto e vírgula | NBR 6028 |
| Legenda de figura | acima da figura; fonte abaixo | a confirmar |
| Legenda de tabela | acima da tabela; fonte abaixo | IBGE |
| Referências | alinhadas à esquerda, sem justificar, espaço simples, separadas por linha em branco | a confirmar |
| Ordenação das referências | alfabética no sistema autor-data | NBR 6023 / 10520 |

O número de páginas do resumo e a faixa de palavras variam por tipo de trabalho — não cite
número sem confirmar qual trabalho.

---

## 3. O que o Typst resolve nativamente

Verificado no compilador 0.15.1 desta máquina (o nome do estilo consta no binário):

```typ
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
#set cite(style: "associacao-brasileira-de-normas-tecnicas")
```

Aceita `.bib` (BibLaTeX) e `.yml` (Hayagriva). Também aceita caminho para um `.csl` próprio,
caso a instituição exija variação local.

Cobertura:

| Elemento | Nativo? |
|---|---|
| Formatação das referências | **sim** |
| Ordenação alfabética | **sim** |
| Citação autor-data e numérica | **sim** |
| Numeração progressiva das seções | sim, via `#set heading(numbering: "1.1")` |
| Sumário | sim, via `#outline()` |
| Listas de figuras e tabelas | sim, via `#outline(target: ...)` |
| Capa e folha de rosto | **não** — é template |
| Folha de aprovação | **não** — é template |
| Ficha catalográfica | **não** — é da biblioteca da instituição |
| Margens, fonte, entrelinhas | não — é `set` no template |
| Recuo de citação longa | não — é `show`/`block` no template |

Essa tabela é boa matéria de slide: separa com clareza **o que a linguagem entrega** de
**o que o template precisa construir**.

---

## 4. Citação — formas em Typst

```typ
// entre parênteses (padrão)
A impedância varia com a frequência @nilsson2015.

// integrada à frase
#cite(<nilsson2015>, form: "prose") demonstra que ...

// com localizador
@nilsson2015[p.~421]

// só o autor / só o ano — conferir suporte da forma antes de usar em slide
#cite(<nilsson2015>, form: "author")
#cite(<nilsson2015>, form: "year")
```

Citação direta longa — estrutura típica, com os valores marcados como do template:

```typ
#let citacao-longa(corpo) = block(
  inset: (left: 4cm),      // valor do template, ver tabela da seção 2
  text(size: 10pt)[
    #set par(justify: true, leading: 0.55em, first-line-indent: 0pt)
    #corpo
  ],
)
```

---

## 5. Entrada `.bib` mínima para os exemplos

Só fontes reais e verificáveis. **Não inventar autor, título, editora, DOI ou URL.**

```bibtex
@book{nilsson2015,
  author    = {Nilsson, James W. and Riedel, Susan A.},
  title     = {Circuitos el{\'e}tricos},
  edition   = {10},
  publisher = {Pearson},
  address   = {S{\~a}o Paulo},
  year      = {2015},
}

@misc{typst-docs,
  author       = {{Typst GmbH}},
  title        = {Typst Documentation},
  howpublished = {\url{https://typst.app/docs/}},
  year         = {2026},
  note         = {Acesso em: 27 ago. 2026},
}
```

Campo `note` com "Acesso em:" é a prática corrente para material online sob NBR 6023.

---

## 6. Perguntas de aula que separam as camadas

Boas para os slides, porque forçam a distinção que o capítulo ensina:

1. "Meu template do curso pede fonte Arial. A ABNT exige Arial?"
2. "Instalei um pacote ABNT do Universe. Meu trabalho está em ABNT?"
3. "Quem define o formato da tabela?"
4. "A ficha catalográfica é exigência da ABNT ou da biblioteca?"
5. "Se o template e o manual do curso divergem, quem ganha?"

Respostas curtas: (1) não — é escolha do template; (2) não — é a leitura que o autor do
pacote fez; (3) o IBGE, referenciado pela NBR 14724; (4) da biblioteca da instituição;
(5) a instituição, que é quem avalia o trabalho.
