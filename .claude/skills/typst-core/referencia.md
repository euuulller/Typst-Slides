# Referência — Typst 0.15

Documento de apoio da skill `typst-core`. Não é cópia da documentação oficial: reúne o que
este projeto usa e o que costuma dar errado. Fonte canônica:
<https://typst.app/docs/reference/> e o PDF offline citado em `references/typst/fontes.md`.

---

## 1. Mapa LaTeX → Typst

Tabela usada nos slides comparativos. Todos os pares foram conferidos contra a doc oficial.

| Objetivo | LaTeX | Typst |
|---|---|---|
| Seção | `\section{Introdução}` | `= Introdução` |
| Subseção | `\subsection{Método}` | `== Método` |
| Negrito | `\textbf{x}` | `*x*` |
| Itálico | `\emph{x}` | `_x_` |
| Código inline | `\texttt{x}` | `` `x` `` |
| Lista | `\begin{itemize}\item a\end{itemize}` | `- a` |
| Lista numerada | `\begin{enumerate}\item a\end{enumerate}` | `+ a` |
| Imagem | `\includegraphics[width=.6\textwidth]{f}` | `image("f.png", width: 60%)` |
| Figura | `\begin{figure}...\caption{}\label{}\end{figure}` | `#figure(..., caption: [...]) <fig:x>` |
| Referência | `\ref{fig:x}` | `@fig:x` |
| Citação | `\cite{chave}` | `@chave` |
| Equação inline | `$x^2$` | `$x^2$` |
| Equação em bloco | `\begin{equation}...\end{equation}` | `$ ... $` (com espaços) |
| Fração | `\frac{a}{b}` | `a/b` ou `frac(a, b)` |
| Matriz | `\begin{pmatrix}...\end{pmatrix}` | `mat(1, 2; 3, 4)` |
| Somatório | `\sum_{i=1}^{n}` | `sum_(i=1)^n` |
| Sumário | `\tableofcontents` | `#outline()` |
| Bibliografia | `\bibliography{refs}` | `#bibliography("refs.bib")` |
| Nova página | `\newpage` | `#pagebreak()` |
| Margens | `\usepackage[margin=2cm]{geometry}` | `#set page(margin: 2cm)` |
| Fonte | `\usepackage{fontspec}\setmainfont{}` | `#set text(font: "…")` |
| Espaçamento entre linhas | `\usepackage{setspace}\onehalfspacing` | `#set par(leading: 0.65em)` |
| Definir comando | `\newcommand{\x}[1]{...}` | `#let x(a) = [...]` |
| Pacote | `\usepackage{p}` | `#import "@preview/p:0.1.0": *` |
| Comentário | `% ...` | `// ...` ou `/* ... */` |

Diferença conceitual a explicar em aula: em LaTeX o pacote é instalado na máquina e a versão
é a que a distribuição tiver; em Typst a versão vai **escrita no arquivo**, e o mesmo fonte
compila igual em qualquer máquina.

---

## 2. Unidades e comprimentos

| Unidade | Significado |
|---|---|
| `pt`, `mm`, `cm`, `in` | absolutas |
| `em` | relativa ao tamanho da fonte corrente |
| `%` | relativa ao contêiner |
| `fr` | fração do espaço livre restante (só em `grid`, `table`, `stack`, `columns`) |

`auto` = decide pelo conteúdo. `none` = ausente. Não confundir: `auto` e `none` são valores
distintos e muitas funções tratam os dois de forma diferente.

---

## 3. Layout — quando usar cada contêiner

| Função | Uso |
|---|---|
| `box` | caixa **inline**, flui com o texto; aceita `clip: true` |
| `block` | caixa de **bloco**, quebra parágrafo |
| `stack` | empilha em `dir: ttb` / `ltr` com `spacing` |
| `grid` | tabela sem semântica de tabela — é o que usar para layout |
| `table` | tabela **de dados**; gera semântica e entra no `outline(target: table)` |
| `columns` | divide o fluxo em N colunas |
| `place` | posicionamento absoluto; `dx`/`dy`; não ocupa espaço |
| `pad` | recuo em torno do conteúdo |
| `align` | alinhamento (`left + top`, `center + horizon`, …) |

Regra do projeto: **layout de slide usa `grid`/`stack`/`place`; `table` só para dado real.**

---

## 4. `figure` — o que muda o comportamento

```typ
#figure(
  image("x.png"),
  caption: [Legenda.],
  kind: image,          // define o contador e o prefixo do @ref
  supplement: [Figura], // rótulo impresso
  placement: none,      // ou auto/top/bottom para flutuar
) <fig:x>
```

- Sem `kind`, o Typst infere pelo conteúdo — funciona para `image` e `table`, mas **não**
  para conteúdo arbitrário. Ao envolver um `grid` ou um bloco de código, informe `kind`.
- `#show figure.caption: it => ...` customiza a legenda (usado no capítulo de ABNT, em que
  a legenda vai acima da figura e a fonte abaixo).
- `#set figure(numbering: "1")` e `#set figure(gap: 0.8em)`.

---

## 5. Referências cruzadas — comportamento de `@`

- `@rotulo` referencia o elemento com aquele label.
- `@rotulo[texto]` troca o texto do link.
- O prefixo impresso vem de `supplement`; `#set ref(supplement: ...)` muda globalmente.
- Um label só pode ser usado **uma vez** no documento — label duplicado é erro de compilação.
- Convenção do projeto: `<fig:…>`, `<tab:…>`, `<eq:…>`, `<sec:…>`, `<lst:…>`.

---

## 6. Matemática — o que costuma sair errado

| Intenção | Errado | Certo |
|---|---|---|
| Texto na fórmula | `$ganho = ...$` | `$"ganho" = ...$` |
| Variável de várias letras | `$Vout$` | `$V_"out"$` |
| Subscrito composto | `$x_i+1$` | `$x_(i+1)$` |
| Multiplicação implícita | `$2x$` | `$2 x$` (o espaço separa) |
| Derivada | `$dx/dt$` | `$(d x)/(d t)$` |
| Unidade | `$5V$` | `$5 "V"$` ou o pacote `unify` |

Símbolos por nome: `alpha`, `omega`, `Omega`, `infinity`, `arrow.r`, `arrow.r.double`,
`plus.minus`, `dot`, `times`, `approx`, `<=` → `lt.eq`, `!=` → `eq.not`.

Numeração e referência de equação:

```typ
#set math.equation(numbering: "(1)")
$ Z = R + j X $ <eq:impedancia>
Da @eq:impedancia obtém-se ...
```

Para numerar só as equações referenciadas, o pacote `equate` resolve; sem pacote, use
`#math.equation(numbering: none)` nas que não devem contar.

---

## 7. Armadilhas específicas da 0.15

Da changelog oficial da 0.15.0 (<https://typst.app/docs/changelog/0.15.0/>):

1. **Caminhos com `\` deixaram de funcionar.** Em Windows, sempre `assets/logos/ifma.png`.
2. **Baseline passou a ser preservada** em mais pontos do layout (box, block, itens de lista,
   equações). Layouts antigos podem deslocar alguns pontos — se um alinhamento vertical
   parecer 1–2 pt fora, é aqui.
3. **`lr.size`** passou a resolver em relação ao glifo base, não ao já escalado.
4. **Múltiplas bibliografias** no mesmo documento passaram a ser permitidas.
5. Novo seletor **`within`**, útil para `show` restrito a um ancestral.
6. Fontes variáveis com parâmetro `variations`.

---

## 8. Diagnóstico de erro

| Mensagem | Causa usual |
|---|---|
| `unknown variable: x` | usou `#` dentro de código, ou identificador inexistente |
| `expected content, found string` | passou `"..."` onde se espera `[...]` |
| `file not found` | caminho com `\`, ou falta `--root` |
| `label occurs multiple times` | dois `<x>` iguais |
| `cannot reference ... without context` | `here()`/`counter().get()` fora de `#context` |
| `unexpected argument` | parâmetro que a função não tem — conferir na doc, não insistir |
| `layout did not converge` | dependência circular entre `context` e o que ele mede |
| *texto some sem erro nenhum* | `---` num deck touying: ver abaixo |

### Bibliografia sai vazia

`#bibliography(...)` imprime **só as obras citadas com `@` no texto**. O parâmetro `full`
vale `false` por padrão. Numa apresentação, que mostra as fontes em vez de citá-las, o
slide de referências sai em branco sem erro nenhum. Use `full: true`.

### Marcador de "última página" não pode ser conteúdo solto

Para descobrir o total de páginas, a tentação é pôr um `#metadata(none)<fim>` no fim do
documento e consultar a página dele. Num deck touying isso cria um **slide vazio** quando
há uma chamada explícita de slide antes. Emita o marcador dentro do rodapé, que é
desenhado em toda página, e consulte a **última** ocorrência.

### O erro que não dá erro: `---` no touying

Em marcação, `---` é travessão. Mas o touying tem
`horizontal-line-to-pagebreak: true` **por padrão** e converte `---` em quebra de slide:
o texto antes e depois do travessão vai parar em páginas diferentes, sem aviso nenhum.

Em português isso é grave, porque travessão é pontuação corrente. Este projeto desliga a
opção em `config/global.typ`; para quebrar um slide sem heading, use `#pagebreak()`.

Compilação com raiz explícita (necessária quando há import fora da pasta do arquivo):

```bash
typst compile --root . main.typ build/main.pdf
typst watch  --root . main.typ build/main.pdf
```
