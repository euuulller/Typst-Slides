// ==========================================================================
//  Typst para Engenharia e Produção Acadêmica
//  IFMA — Campus Imperatriz
//
//  Este arquivo é só o PONTO DE ENTRADA e foi mantido curto de propósito:
//  ele diz ONDE está a configuração e QUAIS seções entram, em que ordem.
//  É o mesmo princípio de organização que a apresentação ensina na seção
//  sobre estrutura modular.
//
//  Compile com:
//      mkdir -p build
//      typst compile --root . main.typ build/main.pdf
//      typst watch   --root . main.typ build/main.pdf
// ==========================================================================

#import "config/global.typ": apresentacao, slide-titulo, slide-topicos, slide-estrutural

// Toda a aparência vive em config/. Trocar o visual da apresentação
// inteira é editar config/theme.typ — nenhuma seção precisa ser tocada.
#show: apresentacao

#slide-titulo()
#slide-topicos()

// --------------------------------------------------------------------------
//  As seções de nível 1 são declaradas AQUI, e não dentro dos arquivos:
//  assim este arquivo continua sendo o mapa da aula. Cada arquivo de
//  sections/ traz só os slides (headings de nível 2) do seu tema.
//
//  Restrição do modelo: a caixa do slide de tópicos comporta ~13 caracteres
//  a 36pt, e cabem no máximo 5 seções na altura útil. Nomes curtos.
// --------------------------------------------------------------------------

= Fundamentos
#include "sections/01-motivacao.typ"
#include "sections/02-typst.typ"
#include "sections/03-primeiro-documento.typ"

= Sintaxe
#include "sections/04-estrutura.typ"
#include "sections/05-formatacao.typ"
#include "sections/06-listas.typ"

= Elementos
#include "sections/07-imagens.typ"
#include "sections/08-tabelas.typ"
#include "sections/09-matematica.typ"

= ABNT
#include "sections/10-referencias.typ"
#include "sections/11-citacoes.typ"
#include "sections/12-abnt.typ"

= Prática
#include "sections/13-universe.typ"
#include "sections/14-pacotes.typ"
#include "sections/15-artigo.typ"
#include "sections/16-conclusao.typ"

// --------------------------------------------------------------------------
//  Referências: slide estrutural, no mesmo desenho de "Tópicos".
//  O estilo ABNT é o nativo do compilador — a apresentação pratica o que
//  ensina na seção de ABNT.
// --------------------------------------------------------------------------
#slide-estrutural[Referências][
  #set text(size: 0.8em)
  // `full: true` é obrigatório aqui: por padrão o Typst imprime SÓ as obras
  // citadas com @ no texto, e uma apresentação não cita — ela mostra.
  #bibliography(
    "referencias.bib",
    style: "associacao-brasileira-de-normas-tecnicas",
    title: none,
    full: true,
  )
]
