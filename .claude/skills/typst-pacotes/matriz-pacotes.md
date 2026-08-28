# Matriz de pacotes — Typst Universe

Arquivo de apoio da skill `typst-pacotes`.

**Consulta:** 27/08/2026, via `https://packages.typst.org/preview/index.json`.
**Compilador do projeto:** Typst 0.15.1.
Todas as versões abaixo são a mais alta publicada na data da consulta.

Legenda de compatibilidade: ✅ compila no 0.15.1 (verificado) · ⚠️ metadado compatível, sem
smoke test ainda · ❔ sem campo `compiler` no índice.

---

## 1. Apresentação

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **touying** | 0.7.4 (06/06/2026) | ≥ 0.12.0 ⚠️ | MIT |
| polylux | 0.4.0 | ❔ | MIT |
| diatypst | 0.9.3 | ≥ 0.12.0 | MIT-0 |
| presentate | 0.2.6 | ≥ 0.13.0 | MIT |
| minideck | 0.2.1 | — | — |
| slydst | 0.1.5 | — | — |

**touying** — o motor escolhido pelo projeto. ✅ **Smoke test em 27/08/2026: compila limpo
no 0.15.1**, sem warning e sem API depreciada.
- *Resolve:* slides a partir de headings, contagem n/N, rastreio da seção corrente,
  `#pause` e animações, modo handout, speaker notes, temas.
- *Usar quando:* a apresentação precisa de estrutura e navegação, não só de páginas soltas.
- *Não usar quando:* são 5 slides estáticos — `#set page` puro basta e é mais legível.
- *Limitação:* traz a dependência transitiva `uniwarn`. Sem `config-common(...)`, headings
  `=` e `==` **não geram slide algum** — é preciso configurar `new-section-slide-fn` para
  o rótulo de seção do cabeçalho funcionar.
- *Armadilha séria:* `horizontal-line-to-pagebreak` é `true` por padrão e transforma
  `---` em quebra de slide. Em texto em português, onde `---` é travessão, isso **engole
  o texto em volta sem erro nenhum**. Desligue em `config-common`.
- *Risco encerrado:* a 0.7.4 é 9 dias anterior ao Typst 0.15.0, mas o smoke test passou.

**polylux** — alternativa mais antiga e mais simples; menos recursos de tema e animação.
Citar na aula como "o outro caminho", não adotar.

**diatypst** — tema pronto e opinativo. Bom para quem quer slide rápido; ruim para quem
precisa reproduzir uma identidade visual específica, que é o nosso caso.

---

## 2. Gráficos e diagramas

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **cetz** | 0.5.2 | ≥ 0.14.0 ⚠️ | LGPL-3.0-or-later |
| **cetz-plot** | 0.1.4 | ≥ 0.13.1 ⚠️ | LGPL-3.0-or-later |
| **fletcher** | 0.5.8 | ≥ 0.13.0 ⚠️ | MIT |
| circuiteria | 0.2.1 | ≥ 0.13.1 | Apache-2.0 |

**cetz** — o TikZ do Typst: desenho vetorial programável.
- *Usar quando:* diagrama que precisa ser exato e versionado junto do texto.
- *Não usar quando:* uma imagem pronta resolve — cetz custa tempo de compilação e de escrita.
- *Limitação:* API ainda muda entre versões menores; fixe a versão.

**cetz-plot** — gráficos (linha, barra, dispersão) sobre o cetz. É pacote **separado**:
importar cetz não traz plot.

**fletcher** — diagramas de nós e setas (blocos, autômatos, fluxo). Muito mais direto que
cetz para grafo. *Não usar* para desenho livre.

**circuiteria** — blocos de circuito. Maturidade baixa (0.2.1), repositório fora do GitHub.
Citar como exemplo de "pacote de nicho a avaliar com cuidado", não adotar sem necessidade.

---

## 3. Código-fonte nos slides

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **codly** | 1.3.0 | ≥ 0.12.0 ⚠️ | MIT |
| zebraw | 0.6.3 | ≥ 0.14.0 | MIT |

**codly** — numeração de linhas, destaque de trecho, rótulo de linguagem, zoom em região.
- *Usar quando:* o slide precisa apontar **uma linha específica** do código.
- *Não usar quando:* bloco curto sem destaque — o ` ``` ` nativo já é bom.
- *Único com versão ≥ 1.0 desta lista* — sinal de estabilidade.

**zebraw** — alternativa com faixas zebradas e realce de linha. Escolher um dos dois, não os
dois: fazem a mesma coisa.

---

## 4. Engenharia e matemática

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **unify** | 0.8.1 | ❔ | MIT |
| physica | 0.9.8 | ≥ 0.14.0 | MIT |
| equate | 0.3.3 | ≥ 0.14.0 | MIT |
| ctheorems | 1.1.3 | ❔ | MIT |
| great-theorems | 0.1.2 | — | — |

**unify** — números com unidade SI, o `siunitx` do Typst: `#qty("3.5", "kV")`,
`#num("1.6e-19")`. Trata espaçamento, expoente e intervalo.
- *Usar quando:* o documento tem grandeza física — todo relatório de Engenharia Elétrica tem.
- *Limitação:* sem campo `compiler` no índice; verificar por compilação.

**physica** — notação de física: derivadas, operadores, bra-ket, tensores. Útil em
Engenharia Elétrica para derivada e transformada; excesso para uso casual.

**equate** — numera e alinha equações de várias linhas, e permite numerar só o que é
referenciado. Resolve uma limitação real do `math.equation` nativo.

**ctheorems** — ambientes de teorema/definição/prova. Versão ≥ 1.0. Relevante para o público
de Computação (matemática discreta).

---

## 5. Algoritmos e pseudocódigo (Computação)

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **lovelace** | 0.3.1 | ≥ 0.13.0 | MIT |
| algorithmic | 1.0.7 | ≥ 0.13.0 | MIT |
| algo | 0.3.6 | — | — |

**lovelace** — pseudocódigo com numeração de linha e indentação, sintaxe leve.
**algorithmic** — mais estruturado, versão ≥ 1.0, mantido pela typst-community.
Escolher um. Para slide, lovelace é mais enxuto; para trabalho escrito, algorithmic.

---

## 6. Apoio ao documento acadêmico

| Pacote | Versão | Compilador | Licença |
|---|---|---|---|
| **glossarium** | 0.5.10 | ≥ 0.13.0 | MIT |
| subpar | 0.2.2 | ≥ 0.12.0 | MIT |
| hydra | 0.6.3 | ≥ 0.12.0 | MIT |
| glossy | 0.9.2 | — | — |
| wordometer | 0.1.5 | — | — |

**glossarium** — glossário e lista de siglas com referência cruzada e primeira ocorrência
por extenso. É o que faz a lista de abreviaturas de um TCC.

**subpar** — subfiguras (a), (b), (c) com numeração e referência próprias. Não há solução
nativa.

**hydra** — cabeçalho que mostra o capítulo/seção corrente. Útil em monografia e tese.

---

## 7. ABNT e templates brasileiros

Todos abaixo de 1.0. Nenhum é oficial de instituição alguma, salvo onde o próprio autor
declara. Ver a skill `typst-abnt` antes de apresentar qualquer um.

| Pacote / template | Versão | Repositório |
|---|---|---|
| abntyp | 0.1.5 | github.com/3sdras/abntyp |
| quati-abnt | 0.1.0 | github.com/gabdumal/quati_abnt |
| min-article | 0.1.0 | github.com/mayconfmelo/min-article |
| min-book | 1.5.1 (≥ 0.15.0) | github.com/mayconfmelo/min-book |
| classic-ppgsi | 0.1.0 | PPgSI-EACH-USP, porte do abntex2 |
| ufscholar | 0.2.0 | UFSC |
| ufpr-unofficial | 2022.1.0 | UFPR, **não oficial** |
| utfpr-tcc-unofficial | 0.1.0 (≥ 0.14.0) | UTFPR, **não oficial** |
| uepg-tcc-unofficial | 0.1.0 (≥ 0.12.0) | UEPG, **não oficial** |
| ferrmat | 0.1.2 (≥ 0.14.0) | ferramentas em português |

Leitura para a aula: **o ecossistema ABNT do Typst ainda é jovem**. Três dos templates
trazem "unofficial" no próprio nome — os autores estão sendo honestos. Somado ao fato de
que o **estilo de citação ABNT já é nativo do compilador**, a recomendação prática é:
use o estilo nativo para referências e construa (ou pegue da instituição) o template de
capa e folha de rosto, em vez de depender de um pacote 0.1.x para a formatação inteira.

---

## 8. Dependências efetivamente adotadas pelo projeto

A preencher conforme cada uma passar no smoke test. Um pacote só entra aqui depois de
compilar.

| Pacote | Versão fixada | Onde é usado | Verificado em |
|---|---|---|---|
| touying | 0.7.4 | `config/global.typ` | 27/08/2026 |

### Smoke test em lote — 28/08/2026, Typst 0.15.1

Todos importam sem erro: `codly` 1.3.0 · `unify` 0.8.1 · `cetz` 0.5.2 · `fletcher` 0.5.8
· `glossarium` 0.5.10 · `subpar` 0.2.2 · `lovelace` 0.3.1.

Teste **funcional** (não só import) em dois deles:

- `unify`: `#qty("3.5", "kV")` → `3,5 kV`; `#num("1.6e-19")` → `1,6 · 10⁻¹⁹`. Confirmado.
  **Limitação encontrada:** `numrange` **não** aceita `unit:` — erro `unexpected argument`.
- `codly`: numeração de linha e realce funcionam; o **rótulo de linguagem exige o pacote
  separado `codly-languages` (0.1.1)**.

Nenhum deles é dependência do projeto: a apresentação usa só touying. Foram testados
porque a seção de curadoria os recomenda, e recomendar sem compilar viola a regra desta
skill.
