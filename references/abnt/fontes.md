# Fontes — ABNT

Registro de rastreabilidade normativa. **Nenhuma afirmação normativa vai para um slide sem
constar aqui.**

**Aviso:** as NBR são documentos pagos e não estão neste repositório. Este arquivo registra
escopo (público) e o que ainda precisa de confirmação. A discussão didática está em
`.claude/skills/typst-abnt/normas.md`.

---

## Normas relevantes — escopo (verificável pelo título público)

| Norma | Título | Rege |
|---|---|---|
| NBR 14724 | Trabalhos acadêmicos — Apresentação | estrutura e apresentação geral |
| NBR 6023 | Referências — Elaboração | formato das referências |
| NBR 6024 | Numeração progressiva das seções de um documento | numeração de seções |
| NBR 6027 | Sumário — Apresentação | sumário |
| NBR 6028 | Resumo, resenha e recensão — Apresentação | resumo e palavras-chave |
| NBR 6034 | Índice — Apresentação | índice remissivo |
| NBR 10520 | Citações em documentos — Apresentação | citação no texto |
| NBR 15287 | Projeto de pesquisa — Apresentação | projeto de pesquisa |
| NBR 10719 | Relatório técnico e/ou científico — Apresentação | relatório técnico |

Consulta ao catálogo: <https://www.abnt.org.br/> · 27/08/2026.

---

## Não é ABNT, mas a ABNT referencia

| Fonte | Rege | Acesso |
|---|---|---|
| IBGE — Normas de apresentação tabular, 3ª ed., 1993 | formato de tabelas | gratuito no site do IBGE |

Ponto didático registrado: quem define o formato da tabela **não é a ABNT**.

---

## Verificado no compilador

**[V]** O estilo `associacao-brasileira-de-normas-tecnicas` está embutido no Typst 0.15.1
(confirmado no binário desta máquina e na documentação oficial de `bibliography`).
Detalhe em `references/typst/fontes.md`.

Cobre: formatação das referências, ordenação e citação autor-data/numérica.

**Saída real, compilada em 28/08/2026** (`examples/abnt/referencias-demo.typ`):

```
CORMEN, Thomas H. et al. Introduction to Algorithms. 4. ed. Cambridge: MIT Press, 2022.
NILSSON, James W.; RIEDEL, Susan A. Electric Circuits. 11. ed. Harlow: Pearson, 2019.
SHANNON, Claude E. A Mathematical Theory of Communication. Bell System Technical
  Journal, v. 27, n. 3, p. 379-423, 1948.
TYPST GMBH. Typst Documentation. Disponível em: <https://typst.app/docs/>.
  Acesso em: 28 ago. 2026.
```

Citação: `(NILSSON; RIEDEL, 2019)` entre parênteses; `Cormen et al. (2022)` com
`form: "prose"`. Desambiguação `2026a`/`2026b` automática. "Disponível em" e "Acesso em"
já saem em português.

**[V] Limitação verificada:** entrada `@misc` com `howpublished` **perde a URL** e deixa
uma vírgula solta (`TYPST GMBH. Typst Documentation. , 2026.`). Para fonte online use
`@online` com `url` e `urldate`.
Não cobre: capa, folha de rosto, folha de aprovação, ficha catalográfica, margens,
entrelinhas e recuo de citação longa — tudo isso é template.

---

## Pendências de confirmação

Itens de prática corrente que **não devem ser apresentados como exigência normativa**
enquanto estiverem nesta lista. Ao confirmar, registre a fonte e a data e mova para cima.

- [ ] Margens 3/3/2/2 cm — NBR 14724?
- [ ] Corpo 12; 10 em citação longa, notas e legendas — NBR 14724?
- [ ] Entrelinhas 1,5 no corpo; simples em citação longa, resumo e referências
- [ ] Recuo de 4 cm em citação longa e limiar de mais de 3 linhas — NBR 10520?
- [ ] Paginação contada da folha de rosto e impressa a partir do textual
- [ ] Seção primária iniciando em nova página
- [ ] Legenda de figura acima e fonte abaixo
- [ ] Referências alinhadas à esquerda, sem justificar, separadas por linha em branco
- [ ] Faixa de palavras do resumo por tipo de trabalho

---

## Requisitos institucionais (IFMA — Campus Imperatriz)

A confirmar junto ao manual do curso / biblioteca. Enquanto vazio, **nenhum slide deve
afirmar exigência do IFMA**.

| Requisito | Fonte | Data |
|---|---|---|
| *(a levantar)* | | |
