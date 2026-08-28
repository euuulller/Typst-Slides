// ==========================================================================
//  macros.typ
//  Componentes de CONTEÚDO, usados dentro dos slides.
//
//  Divisão de responsabilidade:
//    theme.typ        dados (cores, medidas, corpos de texto)
//    componentes.typ  a moldura da página (cabeçalho, rodapé, capa)
//    macros.typ       o que vai DENTRO do slide  <- este arquivo
//    global.typ       o wiring do touying e os tipos de slide
//
//  Nenhum hexadecimal e nenhum "pt" mágico: tudo vem de theme.typ.
// ==========================================================================

#import "theme.typ": cores, fontes, corpo, caixa, limites

// --------------------------------------------------------------------------
// 1. DESTAQUES EM LINHA
// --------------------------------------------------------------------------

// Termo importante, em texto corrido.
#let dest(x) = text(fill: cores.accentdark, weight: "bold", x)

// Nome de função, comando ou arquivo, em texto corrido.
#let cmd(x) = text(font: fontes.mono, fill: cores.primary, size: 0.95em, x)

// Espaço vertical padrão entre blocos. Existe para que nenhuma seção precise
// escrever `v(14pt)` — a regra do projeto proíbe "pt" mágico fora de config/.
#let espaco(n: 1) = v(caixa.gap * n)

// Anotação de apoio: menor e em cor secundária. Comentário sobre um exemplo,
// nunca conteúdo que o aluno precise ler de longe.
#let nota(x) = text(size: 0.85em, fill: cores.secondary, x)

// Moldura neutra para representar uma imagem ausente num exemplo.
#let figura-simulada(largura: 60%, altura: 34pt) = box(
  width: largura,
  height: altura,
  stroke: caixa.borda + cores.muted,
  align(center + horizon, nota[_imagem_]),
)

// --------------------------------------------------------------------------
// 2. CAIXAS
//    Três papéis distintos, três bordas distintas. Se uma caixa nova não tem
//    papel novo, ela não deve existir.
// --------------------------------------------------------------------------

#let caixa-base(cor-borda, espessura, corpo-caixa, preenchimento: cores.branco) = block(
  width: 100%,
  fill: preenchimento,
  stroke: espessura + cor-borda,
  inset: caixa.inset,
  corpo-caixa,
)

// Definição, regra ou ideia central.
#let conceito(corpo-caixa) = caixa-base(cores.primary, caixa.borda, text(
  fill: cores.primary,
  corpo-caixa,
))

// Armadilha, erro comum, "cuidado com isto".
#let alerta(corpo-caixa) = caixa-base(cores.accentdark, caixa.borda-forte, text(
  fill: cores.texto,
  corpo-caixa,
))

// Simula a página do PDF gerado. Usada quando o resultado não pode ser
// renderizado dentro do slide (um `#set page`, um sumário, uma quebra de
// página mudariam o próprio documento da apresentação).
#let saida(corpo-caixa) = caixa-base(cores.muted, caixa.borda, text(
  fill: cores.texto,
  corpo-caixa,
))

// Exercício. O rótulo é fixo para o aluno reconhecer o padrão de longe.
#let desafio(corpo-caixa) = caixa-base(
  cores.accent,
  caixa.borda,
  {
    text(fill: cores.accentdark, weight: "bold", size: 0.85em)[DESAFIO]
    linebreak()
    text(fill: cores.texto, corpo-caixa)
  },
)

// --------------------------------------------------------------------------
// 3. CÓDIGO
//    O realce de sintaxe é o NATIVO do Typst, com a paleta trocada por
//    config/codigo.tmTheme. Nenhum pacote envolvido.
// --------------------------------------------------------------------------

// Bloco de código com moldura. `titulo` nomeia o arquivo ou o contexto.
#let codigo(corpo-codigo, titulo: none) = block(
  width: 100%,
  fill: cores.branco,
  stroke: caixa.borda + cores.accent,
  inset: caixa.inset-codigo,
  {
    if titulo != none {
      text(font: fontes.mono, size: 0.85em, fill: cores.secondary, titulo)
      v(caixa.inset-codigo, weak: true)
    }
    corpo-codigo
  },
)

// --------------------------------------------------------------------------
// 4. LAYOUT DE DUAS COLUNAS
//    Base de todos os slides comparativos e de "código + resultado".
// --------------------------------------------------------------------------

#let duas-colunas(esquerda, direita, proporcao: (1fr, 1fr), espaco: caixa.gap) = grid(
  columns: proporcao,
  column-gutter: espaco,
  align: top,
  esquerda,
  direita,
)

// Par rotulado. Cada lado ganha um rótulo pequeno acima — é o que faz o
// slide comparativo ser lido sem legenda no meio.
#let par-rotulado(rotulo-esq, esquerda, rotulo-dir, direita, proporcao: (1fr, 1fr)) = {
  let rotulo(t) = text(size: 0.85em, fill: cores.secondary, weight: "bold", upper(t))
  duas-colunas(
    proporcao: proporcao,
    { rotulo(rotulo-esq); v(0.3em, weak: true); esquerda },
    { rotulo(rotulo-dir); v(0.3em, weak: true); direita },
  )
}

// Comparação LaTeX x Typst. A ordem é sempre a mesma no material inteiro:
// o que o aluno já conhece à esquerda, o Typst à direita.
#let comparacao(latex, typst, proporcao: (1fr, 1fr)) = par-rotulado(
  "LaTeX", codigo(latex),
  "Typst", codigo(typst),
  proporcao: proporcao,
)

// Código à esquerda, resultado à direita. O padrão dominante da aula.
#let demo(fonte-codigo, resultado, proporcao: (1.1fr, 1fr)) = par-rotulado(
  "Código", codigo(fonte-codigo),
  "Resultado", saida(resultado),
  proporcao: proporcao,
)

// --------------------------------------------------------------------------
// 5. CONTEÚDO ACADÊMICO
// --------------------------------------------------------------------------

// Figura com legenda e crédito, no padrão do modelo: legenda acima,
// fonte abaixo, ambas menores que o corpo.
#let figura(conteudo, legenda: none, fonte: none, largura: 100%) = align(center, {
  if legenda != none {
    text(size: 0.85em, fill: cores.primary, legenda)
    v(0.35em, weak: true)
  }
  box(width: largura, conteudo)
  if fonte != none {
    v(0.35em, weak: true)
    text(size: 0.85em, fill: cores.secondary, fonte)
  }
})

// Equação em destaque, com espaço respirável em volta.
#let equacao(corpo-eq) = block(
  width: 100%,
  above: caixa.gap,
  below: caixa.gap,
  align(center, text(fill: cores.primary, corpo-eq)),
)

// Tabela com o desenho do material: sem grade fechada, só filetes
// horizontais — o padrão de apresentação tabular usado em trabalho técnico.
#let tabela(colunas: auto, alinhamento: auto, ..celulas) = {
  set text(size: 0.9em)
  table(
    columns: colunas,
    align: alinhamento,
    stroke: (x, y) => (
      top: if y == 0 { caixa.borda-forte + cores.primary }
           else if y == 1 { caixa.borda + cores.primary }
           else { none },
      bottom: caixa.borda + cores.muted,
    ),
    fill: (x, y) => if y == 0 { cores.muted.lighten(40%) },
    inset: caixa.inset-tabela,
    ..celulas,
  )
}

// Citação com atribuição. Filete lateral em vez de aspas decorativas.
#let citacao(texto-citado, autor: none) = block(
  width: 100%,
  inset: (left: caixa.inset, y: caixa.inset),
  stroke: (left: caixa.borda-forte + cores.accent),
  {
    text(fill: cores.primary, style: "italic", texto-citado)
    if autor != none {
      v(0.4em, weak: true)
      align(right, text(size: 0.85em, fill: cores.secondary, [--- #autor]))
    }
  },
)

// Ficha de pacote. Os campos são fixos de propósito: a skill typst-pacotes
// exige que todo pacote apresentado diga também quando NÃO usar e a
// limitação. O componente força isso a ser preenchido.
#let pacote(nome, versao: none, resolve: none, usar: none, evitar: none, limite: none) = {
  // Um único grid para todas as linhas, e não um grid por linha: é o que
  // mantém rótulo e valor alinhados quando um valor quebra em duas linhas.
  let linhas = (
    ("resolve", resolve),
    ("usar", usar),
    ("evitar", evitar),
    ("limite", limite),
  ).filter(((_, v)) => v != none)

  let ficha = grid(
    columns: (5.2em, 1fr),
    column-gutter: 0.6em,
    row-gutter: 0.5em,
    align: (right + top, left + top),
    ..linhas
      .map(((r, v)) => (
        text(size: 0.85em, fill: cores.secondary, weight: "bold", upper(r)),
        text(size: 0.9em, fill: cores.texto, v),
      ))
      .flatten(),
  )

  caixa-base(cores.accent, caixa.borda, {
    grid(
      columns: (1fr, auto),
      text(font: fontes.mono, weight: "bold", fill: cores.primary, nome),
      if versao != none {
        text(size: 0.85em, fill: cores.accentdark, font: fontes.mono, versao)
      },
    )
    v(0.5em, weak: true)
    ficha
  })
}
