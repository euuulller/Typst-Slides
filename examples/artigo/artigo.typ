// ==========================================================================
//  artigo.typ — o exemplo completo da aula.
//
//  Só CONTEÚDO: a aparência inteira vem de config.typ. Trocar o template é
//  trocar uma linha, sem tocar em nada daqui.
//
//  Compile com:
//      typst compile --root . examples/artigo/artigo.typ build/artigo.pdf
// ==========================================================================

#import "config.typ": artigo, fonte, ABNT

#show: artigo.with(
  titulo: [Modelagem da impedância de um circuito RLC série],
  autores: ([Euller dos Santos Rodrigues Duarte],),
  instituicao: [Instituto Federal do Maranhão --- Campus Imperatriz],
  resumo: [
    Este trabalho apresenta o modelo analítico da impedância de um circuito RLC série e
    avalia seu comportamento em função da frequência. A partir da associação em série de
    resistor, indutor e capacitor, obtém-se a expressão da impedância complexa e a
    frequência de ressonância. Os valores calculados para $R = 100 thin Omega$,
    $L = 10 thin "mH"$ e $C = 1 thin mu"F"$ mostram comportamento capacitivo abaixo de
    cerca de 1,6 kHz e indutivo acima, com módulo mínimo igual à resistência no
    ponto de ressonância.
  ],
  palavras-chave: ([circuito RLC], [impedância], [ressonância], [resposta em frequência]),
  abstract: [
    This work presents the analytical model of the impedance of a series RLC circuit and
    evaluates its behaviour as a function of frequency. From the series association of
    resistor, inductor and capacitor, the complex impedance and the resonant frequency
    are obtained. Values computed for the same components show capacitive behaviour
    below the resonance and inductive behaviour above it, with the magnitude reaching a
    minimum equal to the resistance at resonance.
  ],
  keywords: ([RLC circuit], [impedance], [resonance], [frequency response]),
)

= Introdução

A análise de circuitos em regime permanente senoidal é a base do estudo de sistemas
elétricos lineares @nilsson2019. O circuito RLC série é o exemplo canônico dessa
análise: reúne os três elementos passivos fundamentais e exibe o fenômeno da ressonância,
que sustenta desde filtros passivos até sistemas de sintonia.

Este trabalho retoma o modelo analítico da impedância desse circuito, calcula sua
resposta em frequência e discute os regimes capacitivo e indutivo.

= Fundamentação teórica

== Impedância complexa

Para uma excitação senoidal de frequência angular $omega$, a impedância da associação
série é a soma das impedâncias individuais:

$ Z(omega) = R + j (omega L - 1/(omega C)) $ <eq:impedancia>

O termo real da @eq:impedancia é a resistência; o imaginário, a reatância líquida
$X(omega) = omega L - 1/(omega C)$. O módulo e a fase seguem de

$ |Z| = sqrt(R^2 + X^2) , quad phi = arctan(X/R) $ <eq:modulo>

== Frequência de ressonância

A reatância se anula quando $omega L = 1 slash (omega C)$, o que define

$ f_0 = 1/(2 pi sqrt(L C)) $ <eq:ressonancia>

Nessa condição, $|Z| = R$: a impedância é mínima e puramente resistiva.

= Metodologia

O circuito analisado é a associação série da @fig:circuito, com
$R = 100 thin Omega$, $L = 10 thin "mH"$ e $C = 1 thin mu"F"$. Avaliaram-se
@eq:impedancia e @eq:modulo em cinco frequências, incluindo a frequência de
ressonância obtida de @eq:ressonancia.

#figure(
  caption: [Associação série dos elementos analisados.],
  {
    let bloco(rotulo) = box(
      width: 2.6cm,
      height: 1.1cm,
      stroke: 0.6pt,
      align(center + horizon, rotulo),
    )
    grid(
      columns: 4,
      column-gutter: 0.5cm,
      align: horizon,
      bloco[$v_"in"(t)$], bloco[$R$], bloco[$L$], bloco[$C$],
    )
  },
) <fig:circuito>

#fonte[elaborado pelo autor.]

= Resultados e discussão

A @tab:impedancia reúne os valores calculados. Abaixo de $f_0$ a reatância capacitiva
domina e a fase é negativa; acima, a indutiva domina e a fase é positiva.

#figure(
  caption: [Impedância calculada em função da frequência.],
  table(
    columns: 5,
    align: (right, right, right, right, right),
    table.header(
      [$f$ (Hz)], [$X_L$ ($Omega$)], [$X_C$ ($Omega$)],
      [$|Z|$ ($Omega$)], [$phi$ (°)],
    ),
    [100],    [6,28],   [1591,55], [1588,4], [−86,4],
    [1000],   [62,83],  [159,15],  [138,8],  [−43,9],
    [1592],   [100,03], [99,97],   [100,0],  [0,0],
    [5000],   [314,16], [31,83],   [299,5],  [70,5],
    [10000],  [628,32], [15,92],   [620,5],  [80,7],
  ),
) <tab:impedancia>

#fonte[elaborado pelo autor.]

Em $f approx 1592$ Hz o módulo cai a $100 thin Omega$, igual a $R$, confirmando
@eq:ressonancia. O comportamento assimétrico em torno da ressonância é esperado: a
reatância capacitiva decresce com $1 slash f$, enquanto a indutiva cresce linearmente
com $f$.

Cabe observar que a seletividade de um circuito ressonante não decorre apenas de $f_0$:
ela depende do fator de qualidade, que relaciona a reatância característica à
resistência @nilsson2019. Quanto menor a resistência, mais estreita a banda passante.

// Aqui entraria uma CITAÇÃO DIRETA LONGA, com o texto transcrito literalmente da fonte
// e a chamada da referência ao final:
//
//   #citacao-longa[
//     ... texto literal da obra ... @nilsson2019
//   ]
//
// Este exemplo não a traz porque não seria honesto inventar a transcrição de uma obra
// real. A função existe em config.typ e está pronta para uso — mas citação direta só
// se escreve com o livro aberto.

= Conclusão

O modelo analítico descreve integralmente o comportamento do circuito RLC série em
regime senoidal. A frequência de ressonância calculada, cerca de 1592 Hz,
separa os regimes capacitivo e indutivo, e nela a impedância se reduz à resistência.
O mesmo desenvolvimento se estende à associação paralela, alterando-se apenas a forma da
associação das admitâncias.

#bibliography("referencias.bib", style: ABNT, title: [REFERÊNCIAS])

#heading(numbering: none)[APÊNDICE A --- Memorial de cálculo]

Os valores da @tab:impedancia decorrem da avaliação direta de @eq:impedancia e
@eq:modulo. Para $f = 1000$ Hz, com $omega = 2 pi f approx 6283,2$ rad/s:

$ X_L = omega L approx 62,83 thin Omega, quad X_C = 1/(omega C) approx 159,15 thin Omega $

$ |Z| = sqrt(100^2 + (62,83 - 159,15)^2) approx 138,8 thin Omega $
