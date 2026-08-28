// ==========================================================================
//  Prática — 14. Curadoria de pacotes
// ==========================================================================
//  Versões apuradas no índice oficial e todos os pacotes desta seção
//  passaram por smoke test no Typst 0.15.1 (28/08/2026).
//  Ver .claude/skills/typst-pacotes/matriz-pacotes.md.
// ==========================================================================

#import "../config/macros.typ": *

== Apresentação e diagramas

#duas-colunas(
  pacote(
    "touying",
    versao: "0.7.4",
    resolve: [slides a partir de headings, contagem n/N, animações],
    usar: [apresentação com estrutura e navegação],
    evitar: [cinco slides estáticos: `#set page` basta],
    limite: [converte `---` em quebra de slide por padrão],
  ),
  pacote(
    "cetz",
    versao: "0.5.2",
    resolve: [desenho vetorial programável --- o TikZ do Typst],
    usar: [diagrama que precisa ser exato e versionado com o texto],
    evitar: [quando uma imagem pronta resolve],
    limite: [API ainda muda entre versões menores],
  ),
)

#espaco()

Para grafos, autômatos e diagramas de blocos, `fletcher` (0.5.8) é bem mais direto que
`cetz`. Para gráficos, `cetz-plot` --- que é um pacote *separado*.

== Código e unidades

#duas-colunas(
  pacote(
    "codly",
    versao: "1.3.0",
    resolve: [numeração de linha e destaque de trecho no código],
    usar: [quando o slide precisa apontar *uma linha* do código],
    evitar: [bloco curto: o realce nativo já basta],
    limite: [o rótulo de linguagem exige `codly-languages` à parte],
  ),
  pacote(
    "unify",
    versao: "0.8.1",
    resolve: [números com unidade SI --- o `siunitx` do Typst],
    usar: [todo relatório de Engenharia tem grandeza física],
    evitar: [texto sem medida],
    limite: [nem toda função aceita `unit:`; confira a documentação],
  ),
)

#espaco()

#duas-colunas(
  proporcao: (1.1fr, 1fr),
  codigo[
```typ
#qty("3.5", "kV")
#num("1.6e-19")
```
  ],
  saida[
    3,5 kV #h(2em) $1,6 dot 10^(-19)$

    #nota[espaçamento e expoente resolvidos]
  ],
)

== Apoio ao trabalho acadêmico

#duas-colunas(
  pacote(
    "glossarium",
    versao: "0.5.10",
    resolve: [glossário e lista de siglas com referência cruzada],
    usar: [lista de abreviaturas de TCC, com primeira ocorrência por extenso],
    evitar: [documento curto, com três siglas],
  ),
  pacote(
    "subpar",
    versao: "0.2.2",
    resolve: [subfiguras (a), (b), (c) numeradas e referenciáveis],
    usar: [comparar formas de onda ou telas lado a lado],
    evitar: [figura única],
    limite: [não há solução nativa equivalente],
  ),
)

#espaco()

Para pseudocódigo: `lovelace` (0.3.1), mais enxuto, ou `algorithmic` (1.0.7), mais
estruturado. Escolha *um*.

== O ecossistema ABNT ainda é jovem

#tabela(
  colunas: (auto, auto, 1fr),
  alinhamento: (left, left, left),
  [*Projeto*], [*Versão*], [*Observação*],
  [`abntyp`], [0.1.5], [documentos no padrão ABNT],
  [`quati-abnt`], [0.1.0], [idem, licença AGPL],
  [`ufscholar`], [0.2.0], [teses e dissertações da UFSC],
  [`utfpr-tcc-unofficial`], [0.1.0], [o próprio nome diz "não oficial"],
  [`uepg-tcc-unofficial`], [0.1.0], [idem],
  [`ufpr-unofficial`], [2022.1.0], [idem],
)

#espaco()

#conceito[
  Quase todos abaixo de 1.0, e três avisam no nome que não são oficiais --- os autores
  estão sendo honestos. Some a isso que *o estilo de citação ABNT já é nativo*: a
  recomendação prática é usar o nativo para as referências e construir (ou pegar da
  instituição) o template de capa e folha de rosto.
]

== Antes de seguir

#duas-colunas(
  alerta[
    Não adicione pacote sem uso real. Cada dependência é algo que pode quebrar na
    véspera da entrega --- e a véspera da entrega é quando você vai compilar.
  ],
  desafio[
    Procure no índice um pacote para uma necessidade sua, aplique as sete verificações e
    escreva as três frases da ficha: o que resolve, quando usar, quando *não* usar.
  ],
)
