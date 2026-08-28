// ==========================================================================
//  metadata.typ
//  Metadados institucionais da apresentação. ÚNICO lugar a editar para
//  trocar título, autor, orientador, local ou data.
//  Nada de layout, nada de cor, nada de tamanho aqui.
// ==========================================================================

// --------------------------------------------------------------------------
//  Data
//
//  O Typst não traz nomes de mês em português: `display("[month repr:long]")`
//  devolve "August". Daí a tabela abaixo.
// --------------------------------------------------------------------------
#let _meses = (
  "janeiro", "fevereiro", "março", "abril", "maio", "junho",
  "julho", "agosto", "setembro", "outubro", "novembro", "dezembro",
)

#let _por-extenso(d) = [#d.day() de #_meses.at(d.month() - 1) de #d.year()]

// `auto` = a data em que o PDF for compilado, atualizada sozinha.
//
// Consequência: o PDF muda de um dia para o outro. É o que se quer num
// material reapresentado várias vezes. Para CONGELAR a data — ao arquivar a
// versão de uma banca, por exemplo — troque `auto` por uma string:
//
//     #let _data = "27 de agosto de 2026"
//
#let _data = auto

// --------------------------------------------------------------------------
//  Metadados
// --------------------------------------------------------------------------
#let info = (
  titulo: "Typst para Engenharia e Produção Acadêmica",

  // Usado no rodapé de todos os slides de conteúdo. Se o título for longo,
  // encurte aqui — o rodapé não quebra em duas linhas.
  titulo-curto: "Typst para Engenharia e Produção Acadêmica",

  autor: "Euller dos Santos Rodrigues Duarte",

  // Forma abreviada, como no PDF de referência ("J. P. L. Morais").
  autor-curto: "E. S. R. Duarte",

  orientador: "Ana Angélica Mathias Macêdo",

  // O rótulo é separado do nome porque em português ele concorda em gênero
  // com a pessoa orientadora. Troque para "Orientadora" se for o caso.
  orientador-rotulo: "Orientador",

  instituicao: "Instituto Federal do Maranhão",
  campus: "Campus Imperatriz",
  local: "Imperatriz, Maranhão",

  data: if _data == auto { _por-extenso(datetime.today()) } else { _data },
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
