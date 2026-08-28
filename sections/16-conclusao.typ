// ==========================================================================
//  Prática — 16. Conclusão
// ==========================================================================

#import "../config/macros.typ": *

== O que você consegue fazer agora

#duas-colunas(
  [
    - estruturar um documento em seções numeradas
    - inserir figuras e tabelas com legenda, fonte e referência
    - escrever matemática e numerá-la
    - manter as referências em ABNT sem formatar à mão
  ],
  [
    - separar conteúdo de aparência em um template
    - avaliar e adotar um pacote com critério
    - montar um artigo acadêmico completo
    - compilar e conferir o resultado
  ],
)

#espaco()

#conceito[
  Nada disso dependeu de decorar sintaxe. Dependeu de uma ideia só: *deixar o documento
  conhecer a própria estrutura* e cobrar dele o trabalho repetitivo.
]

== Typst ou LaTeX?

#tabela(
  colunas: (auto, 1fr, 1fr),
  alinhamento: (left, left, left),
  [], [*LaTeX*], [*Typst*],
  [Maturidade], [40 anos, ecossistema enorme], [desde 2023, ecossistema jovem],
  [Compilação], [múltiplas passagens, programas auxiliares], [uma invocação],
  [Mensagem de erro], [frequentemente críptica], [aponta linha e coluna],
  [Templates de curso], [em geral já existem], [em geral ainda não],
  [Aprender], [curva longa], [curva mais curta],
)

#espaco()

#alerta[
  Se o seu programa de pós-graduação já tem um template LaTeX validado, *use-o*. A
  ferramenta certa é a que entrega o trabalho no prazo.
]

== Uma escolha, não uma conversão

#conceito[
  O Typst não precisa ser apresentado como substituto universal do LaTeX. Ele é uma
  alternativa moderna, especialmente interessante para determinados fluxos acadêmicos.
]

#espaco()

#duas-colunas(
  [
    *Typst brilha quando*
    - você começa o documento do zero
    - o ciclo escrever--ver precisa ser curto
    - o documento é estruturado e muda muito
  ],
  [
    *Fique no LaTeX quando*
    - o template exigido já existe e é LaTeX
    - o periódico exige submissão em LaTeX
    - você depende de um pacote sem equivalente
  ],
)

== Para continuar

#duas-colunas(
  [
    / Documentação: `typst.app/docs`
    / Pacotes: `typst.app/universe`
    / Sem instalar: `typst.app`
    / No editor: extensão *Tinymist*
  ],
  desafio[
    Pegue um trabalho que você já entregou e reescreva as três primeiras páginas em
    Typst. É o único exercício que mostra a diferença de verdade.
  ],
)

#espaco()

#conceito[
  Agora você consegue construir um trabalho acadêmico.
]
