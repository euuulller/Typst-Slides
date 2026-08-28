// ==========================================================================
//  metadata.typ
//  Metadados institucionais da apresentação. ÚNICO lugar a editar para
//  trocar título, autor, orientador, local ou data.
//  Nada de layout, nada de cor, nada de tamanho aqui.
// ==========================================================================

#let info = (
  titulo: "Typst para Engenharia e Produção Acadêmica",

  // Usado no rodapé de todos os slides de conteúdo. Se o título for longo,
  // encurte aqui — o rodapé não quebra em duas linhas.
  titulo-curto: "Typst para Engenharia e Produção Acadêmica",

  autor: "Euller dos Santos Rodrigues Duarte",

  // Forma abreviada, como no PDF de referência ("J. P. L. Morais").
  autor-curto: "E. S. R. Duarte",

  orientador: "Prof. Dr. NOME DO ORIENTADOR",

  instituicao: "Instituto Federal do Maranhão",
  campus: "Campus Imperatriz",
  local: "Imperatriz, Maranhão",
  data: "27 de agosto de 2026",
)

// Caminhos dos logos. Barra normal sempre: desde o Typst 0.15 a barra
// invertida deixou de ser aceita em caminho, inclusive no Windows.
#let logos = (
  ifma: "/assets/logos/ifma.png",
  laboratorio: "/assets/logos/lab.png",

  // A faixa de texto do logo do laboratório vem truncada no arquivo
  // original. Ela é recortada no tema e reescrita como texto real.
  laboratorio-legenda: (
    titulo: "LABORATÓRIO DE PESQUISA",
    subtitulo: "Biologia, Física, Química e Materiais",
  ),
)
