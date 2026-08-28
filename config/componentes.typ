// ==========================================================================
//  componentes.typ
//  A MOLDURA visual: cabeçalho, rodapé, badge de paginação e capa.
//
//  Tudo é desenhado por posicionamento absoluto a partir do canto superior
//  esquerdo da página, e não pelo fluxo do texto. É o que garante que régua,
//  filete, rótulo e badge caiam nas coordenadas medidas do PDF de referência,
//  independentemente do que cada slide tenha dentro.
//
//  Nenhum valor literal aqui: tudo vem de theme.typ e metadata.typ.
// ==========================================================================

#import "@preview/touying:0.7.4": *
#import "theme.typ": (
  cores, fontes, corpo, pagina, margens, reguas, filete, cabecalho as cab,
  rodape as rod, badge, capa,
)
#import "metadata.typ": info, logos

// --------------------------------------------------------------------------
// Auxiliares de posicionamento
// --------------------------------------------------------------------------

// Régua horizontal na cor de destaque. `de` e `ate` são coordenadas x
// absolutas; `y` é a distância a partir do topo da página.
#let regua(de: 0pt, ate: pagina.largura, y: 0pt) = place(
  top + left,
  dx: de,
  dy: y,
  line(length: ate - de, stroke: reguas.espessura + cores.accent),
)

// Coloca um bloco de altura conhecida com o CENTRO vertical em `centro-y`.
// Trabalhar por centro, e não por topo, é o que deixa o texto alinhado com a
// régua mesmo quando o corpo da fonte muda.
#let em-centro-y(centro-y, altura, dx: 0pt, largura: auto, alinhamento: left, corpo-bloco) = place(
  top + left,
  dx: dx,
  dy: centro-y - altura / 2,
  box(width: largura, height: altura, align(alinhamento + horizon, corpo-bloco)),
)

// --------------------------------------------------------------------------
// Badge de paginação: três "cartas" empilhadas, a da frente com n/N.
//
// Numeração por PÁGINA FÍSICA, como no modelo (a capa é a 1).
//
// Duas armadilhas resolvidas aqui:
//  - o contador do touying não serve: o badge é desenhado no `background`,
//    avaliado ANTES de o contador dar o passo (dava "0/3");
//  - `counter(page)` também não: a capa, que troca a margem da página, não o
//    incrementa, e o total saía um a menos que o número de páginas.
// `here().page()` dá a página física, e o total vem de um marcador invisível
// no fim do documento — que é, por definição, a última página.
// --------------------------------------------------------------------------
#let badge-paginacao() = {
  let carta(preenchida) = rect(
    width: badge.largura,
    height: badge.altura,
    stroke: badge.borda + cores.accentdark,
    fill: cores.branco,
    inset: 0pt,
    if preenchida {
      align(center + horizon, text(
        size: corpo.rodape,
        fill: cores.primary,
        context [#here().page()/#query(<fim-da-apresentacao>).first().location().page()],
      ))
    },
  )
  let desloca(dx, dy, c) = place(top + left, dx: dx, dy: dy, c)

  box(width: badge.largura + 6pt, height: badge.altura + 6pt, {
    desloca(6pt, 0pt, carta(false))
    desloca(3pt, 3pt, carta(false))
    desloca(0pt, 6pt, carta(true))
  })
}

// --------------------------------------------------------------------------
// Cabeçalho: [rótulo da seção] | filete | [título centralizado] + régua
//
// O rótulo vem sozinho do heading de nível 1 corrente; o título, do heading
// de nível 2. Nenhum slide escreve o nome da seção à mão.
//
// `rotulo: false` desliga o par rótulo + filete + título: o slide de seção já
// traz o nome da seção em caixa grande, e repeti-lo no cabeçalho seria ruído.
// --------------------------------------------------------------------------
#let cabecalho(rotulo: true) = {
  if rotulo {
    em-centro-y(
      cab.rotulo-centro-y,
      filete.altura,
      dx: cab.rotulo-x,
      largura: filete.x - cab.rotulo-x - 8pt,
      text(
        size: corpo.rotulo-secao,
        fill: cores.secondary,
        utils.display-current-heading(level: 1, numbered: false),
      ),
    )

    place(top + left, dx: filete.x, dy: filete.topo, line(
      angle: 90deg,
      length: filete.altura,
      stroke: filete.espessura + cores.accent,
    ))

    // Centralizado entre o filete e a margem direita da régua — o centro
    // cai em 543pt, e não no centro da página.
    em-centro-y(
      cab.titulo-centro-y,
      filete.altura + 10pt,
      dx: filete.x,
      largura: pagina.largura - margens.regua - filete.x,
      alinhamento: center,
      text(
        size: corpo.titulo-slide,
        fill: cores.primary,
        utils.display-current-heading(level: 2, numbered: false),
      ),
    )
  }

  regua(
    de: margens.regua,
    ate: pagina.largura - margens.regua,
    y: reguas.cabecalho-do-topo,
  )
}

// --------------------------------------------------------------------------
// Rodapé: régua + [autor itálico] [título curto negrito] [badge n/N]
// A régua para antes do badge, como no modelo.
// --------------------------------------------------------------------------
#let rodape() = {
  let altura-linha = 24pt

  regua(
    de: margens.regua,
    ate: reguas.rodape-fim,
    y: pagina.altura - reguas.rodape-da-base,
  )

  em-centro-y(
    rod.texto-centro-y,
    altura-linha,
    dx: rod.autor-x,
    largura: 240pt,
    text(size: corpo.rodape, fill: cores.secondary, style: "italic", info.autor-curto),
  )

  em-centro-y(
    rod.texto-centro-y,
    altura-linha,
    dx: rod.titulo-centro-x - 300pt,
    largura: 600pt,
    alinhamento: center,
    text(size: corpo.rodape, fill: cores.primary, weight: "bold", info.titulo-curto),
  )

  place(
    top + left,
    dx: badge.centro-x - (badge.largura + 6pt) / 2,
    dy: badge.centro-y - (badge.altura + 6pt) / 2,
    badge-paginacao(),
  )
}

// --------------------------------------------------------------------------
// Capa: sem cabeçalho, sem rodapé, sem numeração.
// IFMA à esquerda, laboratório à direita, ambos com a MESMA altura.
// Só a altura é fixada; a largura fica em `auto` para não deformar o logo.
// --------------------------------------------------------------------------
#let logo-laboratorio() = {
  // A faixa "LABORATÓRIO DE PESQUISA" vem truncada no PNG original: ela é
  // recortada aqui e reescrita como texto real logo abaixo.
  let recorte = 0.20  // fração da altura da imagem ocupada pela faixa
  stack(
    dir: ttb,
    spacing: 3pt,
    box(
      height: capa.logo-altura * (1 - recorte),
      clip: true,
      image(logos.laboratorio, height: capa.logo-altura),
    ),
    align(center, text(
      size: 11pt,
      fill: cores.texto,
      weight: "bold",
      font: ("Libertinus Serif",),
      logos.laboratorio-legenda.titulo
        + linebreak()
        + text(size: 10pt, logos.laboratorio-legenda.subtitulo),
    )),
  )
}

// Todos os blocos são posicionados em coordenadas absolutas: a capa não tem
// fluxo de texto, e assim nenhum bloco empurra o seguinte para fora da página.
#let capa-bloco(dy, corpo-bloco) = place(top + left, dx: 0pt, dy: dy, box(
  width: pagina.largura,
  align(center, corpo-bloco),
))

#let slide-capa() = {
  place(top + left, dx: capa.logo-esq-x, dy: capa.logo-topo, box(
    fill: cores.branco,
    inset: 4pt,
    image(logos.ifma, height: capa.logo-altura),
  ))

  place(
    top + left,
    dx: capa.logo-dir-direita - capa.logo-largura-lab,
    dy: capa.logo-topo,
    box(width: capa.logo-largura-lab, logo-laboratorio()),
  )

  capa-bloco(capa.titulo-y, text(
    size: corpo.titulo-capa,
    fill: cores.primary,
    weight: "bold",
    info.titulo,
  ))

  regua(
    de: margens.capa-regua,
    ate: pagina.largura - margens.capa-regua,
    y: pagina.altura - capa.regua-y-da-base,
  )

  capa-bloco(capa.autor-y, text(
    size: corpo.capa-autor,
    fill: cores.primary,
    weight: "bold",
    info.autor + linebreak() + "Orientador: " + info.orientador,
  ))

  capa-bloco(capa.local-y, text(
    size: corpo.capa-local,
    fill: cores.primary,
    info.local + linebreak() + info.data,
  ))
}
