// ==========================================================================
//  theme.typ
//  ÚNICO ponto de verdade visual da apresentação.
//  Nenhum hexadecimal e nenhum "pt" mágico pode aparecer fora deste arquivo.
//
//  Os valores vêm da medição do PDF de referência
//  ("Seminário Relações de Ângulo Barra-Bola v.3.pdf"), extraída dos
//  content streams. A proveniência de cada número está em
//  .claude/skills/typst-slides/design.md — não remeça o PDF.
// ==========================================================================

// --------------------------------------------------------------------------
// 1. CORES SEMÂNTICAS
//    Chame sempre pelo nome do papel, nunca pelo hexadecimal.
// --------------------------------------------------------------------------
#let cores = (
  primary: rgb("#44546A"),     // títulos, corpo, título curto do rodapé
  secondary: rgb("#8497B0"),   // rótulo de seção, autor no rodapé
  accent: rgb("#ED7D31"),      // réguas, filete vertical, bordas
  accentdark: rgb("#C55A11"),  // borda do badge de numeração, destaques
  background: rgb("#F0F0F0"),  // fundo de todos os slides
  texto: rgb("#262626"),       // texto dentro de caixas
  muted: rgb("#D9DCE1"),       // filetes discretos, fundos de apoio
  branco: rgb("#FFFFFF"),
)

// --------------------------------------------------------------------------
// 2. TIPOGRAFIA
//    Calibri é a fonte do próprio PDF de referência; Consolas é a
//    monoespaçada dos blocos de código. Ambas presentes nesta máquina.
//
//    A lista traz SÓ fontes instaladas de propósito: o Typst emite
//    "unknown font family" para cada nome ausente, e esse warning é o mais
//    perigoso deste projeto — o PDF compila igual, com a fonte errada, e a
//    troca passa despercebida. Manter a lista limpa preserva o sinal.
//
//    Em máquina sem Calibri (Linux/macOS), instale a Carlito, que é
//    métrica-compatível, e acrescente-a aqui.
// --------------------------------------------------------------------------
#let fontes = (
  texto: ("Calibri",),
  mono: ("Consolas",),
  matematica: ("New Computer Modern Math",),
)

// Corpos de texto, em pt sobre a página de 960 x 540.
// O PDF de referência oscila entre 27.98 e 44.04 no título porque o
// PowerPoint encolhe títulos longos sozinho; 34pt é o valor conciliado
// (equivale aos 16pt do projeto irmão em Beamer). Os 44pt ficam para os
// slides estruturais, que é onde o original também os usa.
#let corpo = (
  titulo-capa: 32pt,
  titulo-slide: 34pt,
  titulo-estrutural: 44pt,   // Tópicos e Referências
  capa-autor: 24pt,
  capa-local: 24pt,
  caixa-topicos: 36pt,
  texto: 18pt,
  rotulo-secao: 18pt,
  rodape: 18pt,
  codigo: 16pt,
  minimo: 14pt,              // nada abaixo disto em projetor
)

// --------------------------------------------------------------------------
// 3. GEOMETRIA
//    Página de 960 x 540 pt: a dimensão real do PDF de referência, não a
//    "presentation-16-9" do Typst (841.89 x 473.56). Manter 960 x 540 faz
//    os tamanhos medidos valerem direto, sem reescala.
// --------------------------------------------------------------------------
#let pagina = (
  largura: 960pt,
  altura: 540pt,
)

#let margens = (
  regua: 13.3pt,   // recuo lateral das réguas de cabeçalho e rodapé
  texto: 38pt,     // recuo do conteúdo, mais interno que as réguas
  capa-regua: 55.5pt,
)

// Régua do cabeçalho: no original vai de (13.3, 487.9) a (946.7, 482.5),
// levemente inclinada por imprecisão do PowerPoint. Desenhamos horizontal
// na média das duas pontas.
#let reguas = (
  espessura: 2pt,
  cabecalho-do-topo: 54.8pt,    // 540 - 485.2
  rodape-da-base: 49.8pt,
  rodape-fim: 844.7pt,          // para antes do badge
)

#let filete = (
  x: 141.4pt,        // separa o rótulo de seção do título
  altura: 43.1pt,
  espessura: 2pt,
)

#let badge = (
  borda: 1pt,
  largura: 79pt,     // faixa livre entre o fim da régua e a margem direita
  altura: 37pt,
)

#let caixa-topicos = (
  borda: 2.75pt,
  largura: 403pt,    // 0.42 da largura da página
  altura: 38pt,
  espacamento: 15.7pt,
)

#let capa = (
  logo-altura: 124.6pt,
  logo-esq-x: 25.5pt,
  logo-dir-direita: 913.2pt,
  logo-topo: 14.3pt,
  regua-y-da-base: 248.4pt,
)

// --------------------------------------------------------------------------
// 4. LIMITES DE DENSIDADE
//    Usados pela revisão. Um slide que estoura isto está cheio demais.
// --------------------------------------------------------------------------
#let limites = (
  linhas-texto: 8,
  linhas-codigo: 12,
  niveis-lista: 2,
)
