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

#import "config/global.typ": apresentacao, slide-titulo

// Toda a aparência vive em config/. Trocar o visual da apresentação
// inteira é editar config/theme.typ — nenhuma seção precisa ser tocada.
#show: apresentacao

#slide-titulo()

// --------------------------------------------------------------------------
//  Seções
//  As demais entram nas FASES 6 a 11, na ordem do currículo.
// --------------------------------------------------------------------------
#include "sections/01-introducao.typ"
