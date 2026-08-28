---
name: typst-core
description: Sintaxe e semântica da linguagem Typst 0.15 — modos markup/código/matemática, set e show, funções, imports e módulos, labels e referências cruzadas, figuras, tabelas, equações, bibliografia e scripting. Use ao escrever, ler ou corrigir qualquer arquivo .typ deste projeto, ao traduzir um exemplo de LaTeX para Typst, ou ao diagnosticar erro de compilação do Typst. NÃO use quando a pergunta for sobre exigência da ABNT (use typst-abnt), sobre estrutura de trabalho acadêmico (typst-academico), sobre layout ou medidas do slide (typst-slides) ou sobre escolher pacote do Universe (typst-pacotes).
when_to_use: escrever .typ, erro de compilação Typst, "como se faz X no Typst", converter LaTeX para Typst, dúvida sobre set/show/context
---

# Typst — núcleo da linguagem

Compilador do projeto: **0.15.1**. Só afirme comportamento que você viu na doc oficial ou
comprovou compilando. Ver `referencia.md` para tabelas de funções, mapa LaTeX→Typst e
armadilhas da 0.15.

## Os três modos

| Modo | Entra com | Dentro dele |
|---|---|---|
| Markup | padrão do arquivo | texto puro; `#` abre código |
| Código | `#expr` ou `{ }` | expressões; `[ ]` volta para markup |
| Matemática | `$ ... $` | notação matemática |

```typ
Texto normal, #emph[com ênfase] e #calc.pow(2, 10) calculado.

#let destaque(corpo) = text(fill: red, weight: "bold", corpo)
Agora #destaque[isto é vermelho].
```

Regra prática: **`#` só existe no markup**. Dentro de código já se está em código — escrever
`#foo` ali é erro. Dentro de `[ ]` volta-se ao markup e o `#` é necessário de novo.
`$x$` é inline; `$ x $` (com espaço junto aos cifrões) vira bloco centralizado.

## `set` e `show`

`set` define o **padrão** de uma função dali até o fim do bloco atual:

```typ
#set text(font: "Calibri", size: 18pt)
#set par(justify: true)
#set heading(numbering: "1.1")
```

`show` **transforma** o que casa com um seletor. Três formas:

```typ
#show heading.where(level: 1): set text(size: 24pt)   // show-set
#show heading: it => block(it.body)                    // recebe o elemento
#show: template.with(titulo: "X")                      // aplica ao resto do documento
```

Erros recorrentes: `set` fora de escopo não vaza para dentro de uma função já definida;
`show` sem `:` na frente de `set` não é show-set; o `it` de um `show` traz `it.body`,
`it.level`, `it.numbering` — não é uma string.

## Conteúdo, string e valores

`[texto]` é **conteúdo**; `"texto"` é **string**. Não são intercambiáveis: `image("a.png")`
quer string, `figure(caption: [Legenda])` quer conteúdo. Somar conteúdo concatena.

Array de um elemento precisa de vírgula: `(1,)`. Dicionário: `(chave: valor)`.
`.with()` fixa argumentos parcialmente. `..args` coleta o resto.

## Módulos e pacotes

```typ
#import "config/theme.typ": cores, slide-conteudo   // caminho relativo
#import "@preview/touying:0.7.4": *                 // pacote do Universe, versão obrigatória
```

**Barra normal sempre.** Desde a 0.15 o Typst não aceita `\` em caminho, nem no Windows.

`#include "arquivo.typ"` insere o conteúdo renderizado; `#import` traz os símbolos.

## Labels e referências cruzadas

O label vem **depois** do elemento:

```typ
#figure(
  image("assets/circuito.png", width: 60%),
  caption: [Divisor de tensão.],
) <fig:divisor>

Como mostra a @fig:divisor, ...
```

Vale igual para `#table(...) <tab:x>` e para equações: `$ V = R I $ <eq:ohm>`.
`#set math.equation(numbering: "(1)")` liga a numeração das equações.

## Matemática

Identificador de uma letra é variável; de várias letras é símbolo (`alpha`, `sum`, `arrow.r`).
Texto literal dentro de matemática vai entre aspas:

```typ
$ Z(omega) = R + j omega L + 1/(j omega C) $
$ "ganho" = 20 log_10 (V_"out" / V_"in") $
$ mat(1, 2; 3, 4) $   $ vec(x_1, x_2) $
```

`_` é subscrito, `^` sobrescrito; agrupe com parênteses. `lr(...)` controla delimitadores.

## Tabelas e figuras

```typ
#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    table.header([Símbolo], [Grandeza], [Unidade]),
    [$R$], [Resistência], [$Omega$],
  ),
  caption: [Parâmetros do circuito.],
) <tab:parametros>
```

`fr` distribui espaço restante; `auto` ajusta ao conteúdo; `%` é relativo ao contêiner.

## Bibliografia

```typ
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

Aceita `.bib` (BibLaTeX) e `.yml` (Hayagriva), ou caminho para um `.csl` próprio. Cita-se
com `@chave`; `#cite(<chave>, form: "prose")` para citação no texto.

## `context`

Qualquer coisa que dependa do estado do documento (número da página, headings anteriores,
medidas) precisa de `context`, porque só existe depois do layout:

```typ
#context counter(page).display()
#context {
  let anteriores = query(selector(heading).before(here()))
  ...
}
```

Fora de `context`, `counter(...).get()` e `here()` não compilam.

## Como conferir sem chutar

```bash
typst compile --root . arquivo.typ saida.pdf   # erro aponta linha e coluna
```

Antes de afirmar que uma função existe ou aceita um parâmetro, confira na doc oficial
(<https://typst.app/docs/reference/>) ou no PDF offline registrado em
`references/typst/fontes.md`. Não invente parâmetro.
