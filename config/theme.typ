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
// Medidos nas caixas de texto do PDF de referência: título de slide 36pt,
// corpo 18pt. Os 44pt ficam para os slides estruturais (Tópicos e
// Referências), que é onde o original também os usa.
#let corpo = (
  titulo-capa: 32pt,
  titulo-slide: 36pt,
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
  topo: 9pt,
  altura: 43.1pt,
  espessura: 2pt,
)

// Posições medidas nas caixas de texto do slide de conteúdo do modelo.
// "centro-y" é a distância do topo da página ao centro vertical do texto.
#let cabecalho = (
  rotulo-x: 32.4pt,
  rotulo-centro-y: 31.7pt,
  titulo-centro-y: 26.7pt,
)

#let rodape = (
  autor-x: 33.2pt,
  titulo-centro-x: 506.9pt,   // não é o centro da página: o badge desloca
  texto-centro-y: 519.4pt,
)

// Badge: cartas de 77.7 x 31.9 medidas no modelo, empilhadas com deslocamento
// de 3pt em x e 2pt em y por carta — o envelope resultante (83.7 x 35.9) bate
// com o medido (84.4 x 35.9). A carta da frente é a de baixo-esquerda.
#let badge = (
  borda: 1pt,
  largura: 77.7pt,
  altura: 31.9pt,
  desloca-x: 3pt,
  desloca-y: 2pt,
  centro-x: 904.5pt,
  centro-y: 488.1pt,
)

// Caixas do slide de tópicos, medidas no objeto 39 do modelo:
// 5 retângulos idênticos de 240.37 x 50.892 em x = 345.28, com passo médio de
// 75.7pt entre eles. O centro horizontal cai em 465.5 — 14.5pt à ESQUERDA do
// centro da página, e isso é do modelo, não erro.
//
// Consequência de projeto: com 36pt de corpo, cabem ~13 caracteres por caixa.
// Nomes de seção precisam ser curtos ("Fundamentos", "ABNT", "Pacotes"), o que
// aliás é boa prática. Nome longo estoura a caixa e a revisão pega.
#let caixa-topicos = (
  borda: 2.75pt,
  largura: 240.37pt,
  altura: 50.89pt,
  espacamento: 24.8pt,   // passo 75.7 - altura 50.89
  centro-x: 465.5pt,
)

// Blocos da capa em coordenadas absolutas a partir do topo. A capa não tem
// fluxo de texto: cada bloco é colocado onde foi medido, e nenhum empurra o
// seguinte para fora da página.
#let capa = (
  logo-altura: 124.6pt,
  logo-largura-lab: 204.8pt,
  logo-esq-x: 25.5pt,
  logo-dir-direita: 913.2pt,
  logo-topo: 14.3pt,
  regua-y-da-base: 248.4pt,   // régua a 291.6pt do topo
  titulo-y: 202pt,
  autor-y: 316pt,
  local-y: 478pt,
)

// Caixas e blocos de conteúdo (macros.typ). Espessuras e recuos únicos:
// se um componente novo precisa de valor diferente, o valor entra aqui.
#let caixa = (
  borda: 1pt,
  borda-forte: 1.6pt,
  inset: 10pt,
  inset-codigo: 8pt,
  inset-tabela: 7pt,
  gap: 14pt,
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
