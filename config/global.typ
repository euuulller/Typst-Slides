// ==========================================================================
//  global.typ
//  Monta o tema: liga o touying à configuração de theme.typ, metadata.typ e
//  componentes.typ, e devolve UMA função, `apresentacao`, que main.typ
//  aplica ao documento inteiro.
// ==========================================================================

#import "@preview/touying:0.7.4": *
#import "theme.typ": cores, fontes, corpo, pagina, margens, caixa-topicos
#import "metadata.typ": info
#import "componentes.typ": cabecalho, rodape, slide-capa

// Faixas reservadas ao cabeçalho e ao rodapé. Entram como MARGEM da página:
// assim o conteúdo do slide nunca invade essas áreas, em nenhum tipo de
// slide. A moldura é desenhada por cima, em coordenadas absolutas.
#let faixa-cabecalho = 86pt
#let faixa-rodape = 66pt

// --------------------------------------------------------------------------
// Slide de conteúdo — o padrão. A moldura vem do `background` da página.
// --------------------------------------------------------------------------
#let slide(..args) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(self, config-page(background: {
    cabecalho()
    rodape()
  }))
  touying-slide(self: self, ..args)
})

// --------------------------------------------------------------------------
// Slide de capa — sem moldura e fora da contagem.
//
// Os bodies que chegam em `..args` são descartados de propósito: a capa se
// monta sozinha a partir de metadata.typ. Passar mais de um body para
// `touying-slide` faria o composer padrão (`cols`) dividir o slide em
// colunas — foi exatamente o que quebrou a primeira versão do slide de seção.
// --------------------------------------------------------------------------
#let slide-titulo(..args) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(
    self,
    config-page(margin: 0pt, background: none),
    config-common(freeze-slide-counter: true),
  )
  touying-slide(self: self, slide-capa())
})

// --------------------------------------------------------------------------
// Slide de seção — uma caixa de borda laranja com o nome da seção, no mesmo
// desenho das caixas do slide de tópicos. Entra a cada heading de nível 1.
//
// O cabeçalho vai sem rótulo: a caixa já diz o nome da seção.
// --------------------------------------------------------------------------
#let slide-secao(..args) = touying-slide-wrapper(self => {
  let self = utils.merge-dicts(self, config-page(background: {
    cabecalho(rotulo: false)
    rodape()
  }))
  touying-slide(self: self, align(center + horizon, box(
    width: caixa-topicos.largura,
    height: caixa-topicos.altura * 1.6,
    stroke: caixa-topicos.borda + cores.accent,
    align(center + horizon, text(
      size: corpo.caixa-topicos,
      fill: cores.texto,
      utils.display-current-heading(level: 1, numbered: false),
    )),
  )))
})

// --------------------------------------------------------------------------
// O tema
// --------------------------------------------------------------------------
#let apresentacao(..args, body) = {
  show: touying-slides.with(
    config-page(
      width: pagina.largura,
      height: pagina.altura,
      fill: cores.background,
      margin: (
        left: margens.texto,
        right: margens.texto,
        top: faixa-cabecalho,
        bottom: faixa-rodape,
      ),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: slide-secao,
    ),
    config-info(
      title: info.titulo,
      author: info.autor,
      date: info.data,
      institution: info.instituicao,
    ),
    ..args,
  )

  // Idioma importa: define hifenização em português e os rótulos
  // automáticos ("Figura", "Tabela") usados nos exemplos acadêmicos.
  set text(
    font: fontes.texto,
    size: corpo.texto,
    fill: cores.primary,
    lang: "pt",
    region: "br",
  )
  set par(justify: false, leading: 0.65em)
  show raw: set text(font: fontes.mono, size: corpo.codigo)

  body

  // Marcador invisível: o badge de paginação consulta a página deste elemento
  // para saber o total. Ver o comentário em componentes.typ.
  [#metadata(none)<fim-da-apresentacao>]
}
