// ==========================================================================
//  Elementos — 07. Imagens e figuras
// ==========================================================================

#import "../config/macros.typ": *

== Imagem não é figura

#duas-colunas(
  proporcao: (1.15fr, 1fr),
  [
    #codigo[
```typ
// só a imagem, no fluxo do texto
#image("bancada.png", width: 60%)

// a imagem como ELEMENTO do documento
#figure(
  image("bancada.png", width: 60%),
  caption: [Bancada de ensaio.],
) <fig:bancada>
```
    ]
  ],
  conceito[
    `image` desenha. `figure` *numera, entra na lista de figuras e pode ser
    referenciado*. Num trabalho acadêmico, quase sempre é `figure`.
  ],
)

#espaco()

Formatos aceitos: `PNG`, `JPG`, `GIF`, `SVG`, `WebP` e `PDF`.

== Legenda, crédito e referência

#demo(
  proporcao: (1.1fr, 1fr),
```typ
#figure(
  image("curva.svg", width: 70%),
  caption: [Resposta em frequência.],
) <fig:curva>

A @fig:curva mostra a queda
após a frequência de corte.
```,
[
  #align(center)[
    #figura-simulada()
    #v(0.3em)
    #nota[Figura 3 --- Resposta em frequência.]
  ]

  A Figura 3 mostra a queda após a frequência de corte.
],
)

#espaco()

O número da figura e o "Figura 3" do texto são *gerados*. Inserir uma figura antes
renumera tudo.

== Dimensionar sem deformar

#duas-colunas(
  codigo[
```typ
#image("logo.png", width: 40%)   // ok
#image("logo.png", height: 3cm)  // ok

// deforma: os dois eixos travados
#image("logo.png",
       width: 4cm, height: 3cm)
```
  ],
  alerta[
    Fixe *um* eixo e deixe o outro em `auto`. Travar os dois distorce a imagem --- e
    logotipo institucional distorcido é erro que o avaliador vê primeiro.
  ],
)

#espaco()

Use `alt:` para descrever a imagem: é o que torna o PDF acessível a leitor de tela.

== Antes de seguir

#desafio[
  Insira uma figura com legenda e rótulo, referencie-a no texto com `@`, e depois
  acrescente outra figura *antes* dela. Confira que a numeração e a referência se
  ajustaram sozinhas.
]
