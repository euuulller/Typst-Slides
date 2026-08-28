---
name: typst-academico
description: Estrutura de trabalhos acadêmicos em Typst — artigo, relatório técnico, TCC, monografia, dissertação e tese; elementos pré-textuais, textuais e pós-textuais; e como cada um se traduz em figure, table, equation, outline, referência cruzada e bibliografia. Use ao montar exemplos acadêmicos, ao escrever os capítulos sobre documentos acadêmicos ou o artigo completo final, e ao decidir como organizar um documento longo em módulos. NÃO use quando a pergunta for "o que a norma ABNT exige" (use typst-abnt), sintaxe da linguagem (typst-core), layout de slide (typst-slides) ou escolha de pacote (typst-pacotes).
when_to_use: montar artigo/TCC/relatório de exemplo, estrutura de documento acadêmico, resumo e palavras-chave, sumário, apêndice e anexo, organizar documento longo em arquivos
---

# Documentos acadêmicos em Typst

Esta skill trata de **estrutura de documento**. O que a norma exige fica em `typst-abnt` —
as duas são vizinhas de propósito, para não carregarem juntas. Ver `referencia.md` para os
esqueletos completos de cada tipo de trabalho.

## Os três blocos

| Bloco | O que entra |
|---|---|
| Pré-textual | capa, folha de rosto, folha de aprovação, dedicatória, agradecimentos, epígrafe, resumo, abstract, listas de figuras/tabelas/símbolos, sumário |
| Textual | introdução, desenvolvimento (referencial, materiais e métodos, resultados, discussão), conclusão |
| Pós-textual | referências, glossário, apêndices, anexos, índice |

Diferença que os alunos confundem: **apêndice** é material produzido pelo próprio autor;
**anexo** é material de terceiro. O que muda é a autoria, não o conteúdo.

## O que o Typst automatiza

É esse o argumento pedagógico central do bloco acadêmico da apresentação:

| Trabalho manual em editor de texto | No Typst |
|---|---|
| Numerar seções e renumerar ao inserir uma | `#set heading(numbering: "1.1")` |
| Montar e atualizar o sumário | `#outline()` |
| Lista de figuras / de tabelas | `#outline(target: figure.where(kind: image))` |
| Numerar figuras, tabelas e equações | contadores do `figure` e do `math.equation` |
| Trocar "ver figura 5" quando vira a 6 | `@fig:rotulo` |
| Formatar cada referência à mão | `#bibliography(...)` + arquivo `.bib` |
| Padronizar margens, fonte e espaçamento | `set` no template |
| Repetir o mesmo layout em cada trabalho | `#import` de um template |

Regra de aula: mostre sempre o **antes manual** e o **depois automático**. O ganho do Typst
não é escrever menos, é **o documento se manter correto quando muda**.

## Estrutura mínima de um artigo

```typ
#set page(paper: "a4", margin: (top: 3cm, left: 3cm, bottom: 2cm, right: 2cm))
#set text(font: "Libertinus Serif", size: 12pt, lang: "pt", region: "br")
#set par(justify: true, first-line-indent: 1.25cm)
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 14pt, weight: "bold")[Título do trabalho]
  #v(1em)
  Autor · Instituição
]

*Resumo* --- Texto do resumo em parágrafo único.

*Palavras-chave:* uma; duas; três.

= Introdução
...

#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

`lang: "pt"` e `region: "br"` não são decorativos: mudam hifenização, "Figura"/"Tabela" e o
comportamento do `outline`.

## Organização em módulos

Um trabalho longo não vive em um arquivo só. Padrão do projeto:

```
main.typ            entrypoint: importa config, importa capítulos, monta o documento
config/             template, metadados, macros — ponto único de verdade
capitulos/01..N     um arquivo por capítulo, independentes entre si
figuras/            imagens
referencias.bib     bibliografia central
```

`main.typ` só diz **qual** template, **onde** está a configuração e **quais** capítulos
entram, em que ordem. Nenhum capítulo depende de macro definida em outro capítulo.

O template se aplica com uma única linha:

```typ
#import "config/template.typ": trabalho
#show: trabalho.with(titulo: "...", autor: "...", orientador: "...")
```

## Figuras, tabelas e equações

- Toda figura e toda tabela precisam de **legenda** e de **label**; se não são referenciadas
  no texto, ou falta a referência ou a figura é dispensável.
- Fonte/crédito é obrigatório quando o material não é do autor.
- Equação que será citada recebe numeração e label; equação de passagem, não.
- Tabela de dados usa `#table`; layout usa `#grid`.

## Exemplos por curso

Os exemplos do projeto devem ser realistas e pequenos.

- **Engenharia Elétrica**: impedância de circuito RLC, função de transferência, resposta em
  frequência, tabela de medições com unidades SI, diagrama de blocos de sistema de controle.
- **Ciência da Computação**: complexidade assintótica, pseudocódigo de algoritmo, tabela de
  resultados experimentais, esquema de banco de dados, matemática discreta.

Nunca use dado inventado apresentado como resultado real. Se o número é ilustrativo, o
texto do slide diz que é ilustrativo.

## Ver também

`referencia.md`: esqueletos completos de artigo, relatório técnico e TCC/monografia, com
folha de rosto, resumo, sumário, listas e apêndices já montados.
