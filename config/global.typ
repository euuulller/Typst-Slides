// ==========================================================================
//  global.typ
//  Monta o tema: liga o touying à configuração de theme.typ e metadata.typ
//  e devolve UMA função, `apresentacao`, que main.typ aplica ao documento.
//
//  Os componentes visuais (capa, cabeçalho, rodapé, badge, tipos de slide)
//  entram na FASE 4/5. Aqui fica só a espinha: página, fonte e informações.
// ==========================================================================

#import "@preview/touying:0.7.4": *
#import "theme.typ": cores, fontes, corpo, pagina, margens
#import "metadata.typ": info

// Espaço vertical reservado ao cabeçalho e ao rodapé. O conteúdo do slide
// nunca invade essas faixas — por isso entram como margem da página, e não
// como espaçamento dentro de cada slide.
#let faixa-cabecalho = 74pt
#let faixa-rodape = 66pt

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
}
