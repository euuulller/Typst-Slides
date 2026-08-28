// ==========================================================================
//  ABNT — 12. As camadas: norma, template e instituição
// ==========================================================================
//  Regra desta seção: nenhuma exigência normativa é afirmada sem nomear a
//  NBR. O que é prática corrente vai rotulado como prática corrente.
// ==========================================================================

#import "../config/macros.typ": *

== As cinco camadas

#tabela(
  colunas: (auto, 1fr),
  alinhamento: (left, left),
  [*Camada*], [*O que é*],
  [Typst], [linguagem + compilador + ecossistema],
  [_Package_], [funcionalidade reutilizável que você importa],
  [_Template_], [estrutura e estilo prontos, que você adota e edita],
  [ABNT], [conjunto de normas técnicas],
  [Instituição], [exigências adicionais do curso, do departamento, da biblioteca],
)

#espaco()

#alerta[
  *Usar Typst não é estar em ABNT.* Um pacote chamado "abnt" também não é a norma: é a
  leitura que o autor dele fez da norma.
]

== O que cada norma rege

#tabela(
  colunas: (auto, 1fr),
  alinhamento: (left, left),
  [*Norma*], [*Rege*],
  [NBR 14724], [trabalhos acadêmicos: estrutura e apresentação],
  [NBR 6023], [referências: elaboração],
  [NBR 6024], [numeração progressiva das seções],
  [NBR 6027], [sumário],
  [NBR 6028], [resumo],
  [NBR 10520], [citações em documentos],
  [_IBGE_], [apresentação tabular --- *não é ABNT*],
)

#espaco()

A última linha costuma surpreender: quem define o formato da tabela é a norma de
apresentação tabular do IBGE, que a NBR 14724 referencia.

== O que é nativo e o que é template

#duas-colunas(
  [
    *Resolvido pelo compilador*
    - formatação das referências
    - ordenação alfabética
    - citação autor-data e numérica
    - numeração progressiva das seções
    - sumário e listas de figuras e tabelas
  ],
  [
    *Trabalho de template*
    - capa e folha de rosto
    - folha de aprovação
    - margens, fonte, entrelinhas
    - recuo da citação longa
    - ficha catalográfica (é da biblioteca)
  ],
)

#espaco()

#conceito[
  A metade chata --- formatar cada referência --- sai de graça. A outra metade é
  estrutura de página, e é onde entra o template do seu curso.
]

== Cinco perguntas que separam as camadas

#tabela(
  colunas: (1fr, auto),
  alinhamento: (left, left),
  [*Pergunta*], [*Resposta*],
  [O template pede fonte Arial. A ABNT exige Arial?], [não: é do template],
  [Instalei um pacote "abnt". Meu trabalho está em ABNT?], [não: é a leitura do autor],
  [Quem define o formato da tabela?], [o IBGE],
  [A ficha catalográfica é exigência da ABNT?], [não: é da biblioteca],
  [Template e manual do curso divergem. Quem ganha?], [a instituição],
)

== Antes de seguir

#duas-colunas(
  conceito[
    Ao afirmar que algo "é exigência da ABNT", *nomeie a NBR*. Se não conseguir apontar
    onde está escrito, é prática corrente --- e deve ser dito assim.
  ],
  desafio[
    Abra o manual de TCC do seu curso e classifique cinco exigências dele: quais vêm de
    uma NBR e quais são decisão da instituição?
  ],
)
