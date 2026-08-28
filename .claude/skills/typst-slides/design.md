# Medidas do PDF de referência

Arquivo de apoio da skill `typst-slides`. **Auditoria já realizada — não refazer.**

Fonte: `Seminário Relações de Ângulo Barra-Bola v.3.pdf`. Os valores abaixo foram extraídos
descomprimindo os content streams do PDF (objetos 4, 39, 69 e 112) e lendo os operadores de
desenho e de texto. Cada linha traz o objeto de onde veio. Coordenadas em pontos PostScript,
**origem no canto inferior esquerdo**, página de 960 × 540 pt.

Conversão útil: `y_typst_do_topo = 540 - y_pdf`.

---

## 1. Página e fundo

| Item | Valor | Proveniência |
|---|---|---|
| MediaBox | `[0 0 960 540]` | dicionário de página |
| Fundo | `0.941 g` → **#F0F0F0** | retângulo `0 0 960 540 f*` em todos os objetos |
| Fontes embutidas | Calibri, Calibri-Bold, Calibri-Italic | `/BaseFont` |

Não há outra fonte no documento. Toda a tipografia do modelo é Calibri.

---

## 2. Slide de conteúdo (objeto 69)

| Elemento | Medida |
|---|---|
| Régua do cabeçalho | traço **2 pt**, `0.929 0.49 0.192` = **#ED7D31**, de **(13.3, 487.9)** a **(946.7, 482.5)** |
| Régua do rodapé | traço **2 pt** #ED7D31, de **(13.3, 49.8)** a **(844.7, 49.8)** |
| Filete vertical do rótulo | traço **2 pt** #ED7D31, em **x = 141.4**, de **y 531.0** a **y 487.9** (altura 43.1 pt) |
| Borda do badge n/N | traço **1 pt**, `0.773 0.353 0.0667` = **#C55A11** |
| Título do slide | **36 pt** |
| Corpo, rótulo de seção, legenda, fonte da figura, rodapé | **18 pt** |
| Primeiro bullet do corpo ("Deals") | 27.98 pt |

### Caixas de texto exatas (operadores `Tm` + clip `W*` do objeto 69)

Coordenadas x absolutas e `centro-y` medido a partir do **topo** da página.

| Texto | x início | largura | centro-y do topo | Fonte |
|---|---|---|---|---|
| Rótulo de seção ("Introduction") | **32.4** | 88.3 | **31.7** | 18 pt |
| Título do slide | **357.4** | 371.3 | **26.7** | 36 pt |
| Autor no rodapé | **33.2** | 97.6 | **518.0** | 18 pt itálico |
| Título curto no rodapé | **285.2** | 443.3 | **519.4** | 18 pt negrito |
| Badge "3" + "/32" | **894.2** | 32.5 | **493.6** | 18 pt |

Centros derivados, que são o que o tema usa:

- Título do slide: centro em **543.0** — centralizado entre o filete (141.4) e a
  margem direita da régua (946.7), **não** no centro da página.
- Título curto do rodapé: centro em **506.9** — deslocado à direita do centro da
  página (480) porque o badge come espaço à direita.
- Badge: centro em **910.5**, ou seja, **straddling** a régua do rodapé (490.2).

Leituras derivadas:

- Margem lateral das réguas: **13.3 pt** de cada lado (960 − 946.7 = 13.3).
- A régua do cabeçalho é levemente inclinada no original (487.9 → 482.5): é imprecisão do
  PowerPoint. **Desenhar horizontal em y ≈ 485.2** (média).
- Altura livre do cabeçalho: do topo (540) até a régua (≈485) = **≈ 55 pt**.
- A régua do rodapé **para em x = 844.7** para abrir espaço ao badge; o badge ocupa a faixa
  de ≈ 850 a ≈ 947, altura compatível com os 43 pt do bloco de rodapé.
- Faixa útil de conteúdo: **y de ≈ 50 a ≈ 485** → altura ≈ 435 pt.
- Rótulo de seção: ocupa de x ≈ 27 até o filete em x = 141.4.

---

## 3. Capa (objeto 4)

| Elemento | Medida |
|---|---|
| Logo IFMA (`Image37`) | **149.5 × 124.6 pt** em **(25.5, 401.1)** — topo em 525.7 |
| Logo do laboratório (`Image35`) | **204.8 × 124.6 pt** em **(708.4, 385.0)** — direita em 913.2 |
| Régua central | **2 pt** #ED7D31, de **(55.7, 248.4)** a **(904.8, 248.4)** |
| Título | **32.04 pt** |
| Autor e orientador | **24 pt**, negrito |
| Cidade e data | **24 pt**, regular |

Leituras derivadas:

- Os dois logos têm a **mesma altura, 124.6 pt**; só a largura difere (proporção original).
- A régua da capa é mais recuada que a dos slides de conteúdo: inset **≈ 55.5 pt** de cada
  lado, contra 13.3 pt nos demais.
- A capa não tem cabeçalho nem rodapé nem numeração.

Razões de aspecto dos arquivos em `assets/logos/`:

| Arquivo | Pixels | Proporção | Confere com o PDF? |
|---|---|---|---|
| `ifma.png` | 822 × 1200 | 0.685 | 149.5/124.6 = 1.20 → **não**: no PDF o IFMA aparece mais largo que alto |
| `lab.png` | 1619 × 971 | 1.667 | 204.8/124.6 = 1.64 → **sim** |

O `ifma.png` é a versão vertical completa. No PDF de referência ele aparece recortado dentro
de uma moldura branca. Ao montar a capa, **fixe a altura em 124.6 pt e deixe a largura em
`auto`** para preservar a proporção — nunca force os dois eixos.

---

## 4. Slide de tópicos (objeto 39)

| Elemento | Medida |
|---|---|
| Título "Topics" | **44.04 pt** |
| Texto dentro das caixas | **36 pt** |
| Borda das caixas | traço **2.75 pt** #ED7D31 |
| Réguas de cabeçalho e rodapé | iguais às do slide de conteúdo |

Os 5 retângulos, lidos direto dos operadores `re S`:

| # | x | y | largura | altura | centro-y do topo |
|---|---|---|---|---|---|
| 1 | 345.28 | 404.42 | 240.37 | 50.892 | 110.1 |
| 2 | 345.28 | 328.54 | 240.37 | 50.892 | 186.0 |
| 3 | 345.28 | 248.40 | 240.37 | 50.892 | 266.2 |
| 4 | 345.28 | 176.27 | 240.37 | 50.892 | 338.3 |
| 5 | 345.28 | 101.60 | 240.37 | 50.892 | 413.0 |

- Todas idênticas: **240.37 × 50.892 pt**.
- **Centro horizontal em 465.5** — 14.5 pt à *esquerda* do centro da página (480).
  É do modelo, não erro de medição.
- Passo entre caixas: 75.88, 80.14, 72.13, 74.67 → média **75.7 pt**, ou seja
  **24.8 pt** de espaço entre uma caixa e a seguinte. A oscilação é imprecisão do
  PowerPoint; o tema padroniza.

**Restrição de projeto que isto impõe:** com 36 pt de corpo em 240 pt de largura cabem
cerca de **13 caracteres**. Nome de seção precisa ser curto — "Fundamentos", "ABNT",
"Pacotes". O modelo faz o mesmo (Introduction, Derivation, Properties).

### Badge de paginação (mesmo desenho em todos os slides)

Dois retângulos distintos, ambos **77.7 × 31.9 pt**, deslocados de (6.0, 4.1):

| | x | y |
|---|---|---|
| carta da frente (com o número) | 862.3 | 34.0 |
| carta de trás | 868.3 | 38.1 |

Envelope **84.4 × 35.9 pt**, centro em **(904.5, 488.1 do topo)**. A pilha cresce para
cima e para a direita; a carta da frente é a de baixo-esquerda.

---

## 5. Slide de referências (objeto 112)

| Elemento | Medida |
|---|---|
| Título "References" | **44.04 pt** |
| Corpo das entradas | **18 pt** (regular, negrito no título da obra, itálico no periódico) |
| Sobrescrito ("8ᵗʰ") | 12 pt |

---

## 6. Tamanhos de título — correção da primeira medição

**A FASE 1 registrou 27.98 pt como título do slide de conteúdo. Estava errado:** aquele
valor é do primeiro bullet do corpo ("Deals"). A extração dos operadores `Tm` mostrou que o
título "Purpose of control theory" sai a **36 pt**.

Com isso a suposta inconsistência do modelo some quase toda: 36 pt no slide de conteúdo e
44.04 pt nos estruturais (Tópicos, Referências), que têm título curto e centralizado na
página inteira.

**Decisão do projeto:** título de slide **36 pt** (medido); **44 pt** nos slides
estruturais. Títulos longos devem ser encurtados no texto, não encolhidos automaticamente —
autofit é o que tornou o modelo original inconsistente.

---

## 7. Tabela de tokens para `config/theme.typ`

Valores a transcrever no tema. Onde houver medida direta, ela prevalece; onde o original
oscila, vale o valor conciliado.

| Token | Valor |
|---|---|
| `pagina.largura` | 960 pt |
| `pagina.altura` | 540 pt |
| `margem.regua` | 13.3 pt |
| `margem.texto` | 38 pt (conteúdo recuado em relação às réguas, como no original) |
| `regua.espessura` | 2 pt |
| `regua.cabecalho.y` | 485.2 pt a partir da base → 54.8 pt do topo |
| `regua.rodape.y` | 49.8 pt a partir da base |
| `regua.rodape.fim` | 844.7 pt |
| `filete.x` | 141.4 pt |
| `filete.altura` | 43.1 pt |
| `filete.espessura` | 2 pt |
| `badge.borda` | 1 pt, `accentdark` |
| `badge.centro` | x 910.5 pt, y 493.6 pt do topo |
| `cabecalho.rotulo-x` | 32.4 pt |
| `cabecalho.rotulo-centro-y` | 31.7 pt do topo |
| `cabecalho.titulo-centro-y` | 26.7 pt do topo |
| `rodape.autor-x` | 33.2 pt |
| `rodape.titulo-centro-x` | 506.9 pt |
| `rodape.texto-centro-y` | 519.4 pt do topo |
| `caixa.topicos.borda` | 2.75 pt, `accent` |
| `capa.regua.inset` | 55.5 pt |
| `capa.logo.altura` | 124.6 pt |
| `capa.logo.esq.x` | 25.5 pt |
| `capa.logo.dir.direita` | 913.2 pt |
| `fonte.titulo.slide` | 36 pt |
| `fonte.titulo.estrutural` | 44 pt |
| `fonte.titulo.capa` | 32 pt |
| `fonte.capa.autor` | 24 pt, negrito |
| `fonte.corpo` | 18 pt |
| `fonte.rotulo.secao` | 18 pt, `secondary` |
| `fonte.rodape` | 18 pt |
| `fonte.minima` | 14 pt |

---

## 8. Como refazer a medição (se algum dia for preciso)

```python
import re, zlib
d = open('Seminário Relações de Ângulo Barra-Bola v.3.pdf', 'rb').read()
for m in re.finditer(rb'(\d+) 0 obj(.*?)endobj', d, re.S):
    s = re.search(rb'stream\r?\n(.*?)\r?\nendstream', m.group(2), re.S)
    if not s: continue
    try: txt = zlib.decompress(s.group(1)).decode('latin1')
    except Exception: continue
    # traços:  "x y m\nx y l\nS"   ·  cor: "r g b RG"  ·  espessura: "N w"
    # texto:   "/F1 18 Tf"          ·  imagem: "w 0 0 h x y cm\n/Image Do"
```

Objetos relevantes: **4** (capa), **39** (tópicos), **69** (conteúdo), **112** (referências).
