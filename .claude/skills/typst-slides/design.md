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
| Título do slide | **27.98 pt** |
| Corpo, rótulo de seção, legenda, fonte da figura, rodapé | **18 pt** |

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

São 5 caixas empilhadas e centralizadas, uma por seção.

---

## 5. Slide de referências (objeto 112)

| Elemento | Medida |
|---|---|
| Título "References" | **44.04 pt** |
| Corpo das entradas | **18 pt** (regular, negrito no título da obra, itálico no periódico) |
| Sobrescrito ("8ᵗʰ") | 12 pt |

---

## 6. Reconciliação dos tamanhos de título

O PDF de referência é inconsistente: "Topics" e "References" saem a **44.04 pt** e
"Purpose of control theory" a **27.98 pt**. É o *autofit* do PowerPoint encolhendo o título
mais longo, não uma decisão de projeto.

O projeto irmão em LaTeX resolveu isso padronizando o título de frame em 16 pt sobre a
página Beamer de ≈ 453 pt de largura — equivalente a **≈ 34 pt** nesta página de 960 pt.

**Decisão do projeto:** título de slide **34 pt**, com redução automática para títulos
longos. Os 44 pt ficam reservados aos slides estruturais sem rótulo de seção (Tópicos e
Referências), que é onde o original também os usa.

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
| `caixa.topicos.borda` | 2.75 pt, `accent` |
| `capa.regua.inset` | 55.5 pt |
| `capa.logo.altura` | 124.6 pt |
| `capa.logo.esq.x` | 25.5 pt |
| `capa.logo.dir.direita` | 913.2 pt |
| `fonte.titulo.slide` | 34 pt |
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
