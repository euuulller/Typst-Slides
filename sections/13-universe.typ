// ==========================================================================
//  Prática — 13. O Typst Universe
// ==========================================================================

#import "../config/macros.typ": *

== O Typst Universe

#conceito[
  O registro público de *packages* e *templates* do Typst, em
  `typst.app/universe`. Publicar ali é abrir um _pull request_ --- não há curadoria
  editorial.
]

#espaco()

#alerta[
  *Nenhum pacote do Universe é "oficial do Typst".* Oficiais são o compilador e a
  documentação em `typst.app/docs`. Estar no Universe significa estar publicado, não
  aprovado.
]

#espaco()

Categorias para navegar: _Presentation_, _Paper_, _Thesis_, _Report_, _Book_,
_Visualization_, _Layout_, _Text_, _Model_, _Components_, _Scripting_, _Integration_.

== _Package_ ou _template_?

#tabela(
  colunas: (auto, 1fr, 1fr),
  alinhamento: (left, left, left),
  [], [*Package*], [*Template*],
  [Para que serve], [funcionalidade reutilizável], [ponto de partida de um documento],
  [Como se usa], [`#import "@preview/nome:1.0.0"`], [`typst init @preview/nome`],
  [O que produz], [funções que você chama], [uma pasta com arquivos prontos],
  [Depois de usar], [continua sendo dependência], [o código passa a ser seu],
)

#espaco()

Os dois moram no mesmo lugar e a busca mistura os dois. O template você *adota e edita*;
o package você *importa e mantém atualizado*.

== A versão vai escrita no arquivo

#duas-colunas(
  proporcao: (1.1fr, 1fr),
  codigo[
```typ
#import "@preview/cetz:0.5.2": *
#import "@preview/codly:1.3.0": *
```
  ],
  conceito[
    Em LaTeX, a versão do pacote é a que a máquina tiver. Em Typst ela está *no
    documento*: o mesmo fonte compila igual em qualquer máquina, hoje e daqui a três
    anos.
  ],
)

#espaco()

O compilador baixa e guarda em cache na primeira compilação. Não existe "instalar
pacote".

== Como pesquisar de verdade

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  codigo[
```bash
curl -s https://packages.typst.org/\
preview/index.json
```
  ],
  [
    A página de busca do Universe é uma aplicação JavaScript: ela não responde bem a
    ferramenta automática.

    #espaco()
    O *índice oficial em JSON* é a mesma fonte, e traz `version`, `compiler`,
    `categories`, `license` e `repository` de todos os pacotes.
  ],
)

== Sete verificações antes de importar

#tabela(
  colunas: (auto, 1fr),
  alinhamento: (left, left),
  [*Verifique*], [*Reprova se*],
  [versão mais recente], [você fixou uma antiga sem motivo],
  [`compiler` mínimo], [exige compilador mais novo que o seu],
  [data da última atualização], [parado há muito tempo *e* há alternativa viva],
  [repositório], [não é público],
  [documentação], [é um `README` de uma linha],
  [licença], [incompatível com o seu uso],
  [*compila de verdade*], [falha no teste mínimo],
)

#espaco()

#alerta[
  A última linha não é opcional. *Metadado no índice não é prova de compatibilidade* ---
  compile um exemplo mínimo antes de adotar.
]
