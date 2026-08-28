---
name: typst-slides
description: Sistema visual da apresentação — identidade IFMA/Campus Imperatriz medida do PDF de referência, anatomia de cada tipo de slide, componentes do tema e regras de densidade, legibilidade e projeção. Use ao criar ou alterar qualquer slide, ao mexer em config/theme.typ ou config/global.typ, ao decidir tamanho de fonte, cor, espaçamento ou posição de elemento, e ao julgar se um slide tem conteúdo demais. NÃO use para sintaxe da linguagem (typst-core), para regra de norma ABNT (typst-abnt) nem para escolher pacote (typst-pacotes). As medidas exatas em pt estão em design.md — leia esse arquivo antes de inventar qualquer valor.
when_to_use: criar slide, editar theme.typ, escolher cor/tamanho/espaçamento, slide parece cheio ou desalinhado, comparar com o PDF de referência
paths:
  - config/**
  - sections/**
  - main.typ
---

# Sistema visual da apresentação

O alvo é **reproduzir o padrão do PDF de referência**
(`Seminário Relações de Ângulo Barra-Bola v.3.pdf`), não criar um visual novo. Todas as
medidas foram extraídas dos content streams desse PDF e estão em `design.md`. **Nunca
estime um valor que já está medido lá.**

## Regra nº 1 — ponto único de verdade

Cor, fonte, tamanho, espaçamento, régua, logo e componente vivem **só** em `config/`.

- Nenhum hexadecimal fora de `config/theme.typ`.
- Nenhum `pt` mágico dentro de `sections/`.
- Defeito em mais de um slide → conserta no tema. Defeito em um slide só → conserta na seção.
- Nunca replique o mesmo remendo em vários arquivos.

Se um slide precisa de algo que o tema não oferece, o certo é **criar um componente no
tema**, não um ajuste inline.

## Paleta semântica

| Token | Hex | Uso |
|---|---|---|
| `primary` | `#44546A` | títulos, corpo, título curto do rodapé |
| `secondary` | `#8497B0` | rótulo de seção, autor no rodapé |
| `accent` | `#ED7D31` | réguas, filete vertical, bordas |
| `accentdark` | `#C55A11` | borda do badge de numeração, destaques |
| `background` | `#F0F0F0` | fundo de todos os slides |
| `texto` | `#262626` | texto dentro de caixas |
| `muted` | `#D9DCE1` | filetes discretos, fundos de apoio |

Chame sempre pelo nome semântico. `cores.accent`, nunca `rgb("#ED7D31")`.

## Geometria

Página **960 × 540 pt** — a dimensão real do PDF de referência, não a
`"presentation-16-9"` do Typst. Isso deixa os tamanhos de fonte medidos valerem direto.

Fonte **Calibri** (a fonte do próprio PDF de referência, instalada nesta máquina), com
fallback declarado no tema. Monoespaçada: **Consolas**.

## Anatomia dos slides

- **Capa** — sem cabeçalho e sem rodapé. Logo do IFMA à esquerda, logo do laboratório à
  direita, título centralizado, régua laranja, autor + orientador, cidade + data no pé.
- **Tópicos** — título grande + régua; uma caixa retangular de borda laranja por seção,
  empilhadas e centralizadas.
- **Conteúdo** — rótulo da seção (pequeno, à esquerda) + filete vertical laranja + título
  centralizado; régua laranja abaixo. Rodapé: régua + `[autor itálico]`
  `[título curto negrito]` `[badge n/N]`.
- **Referências** — layout de conteúdo, entradas em `primary`, corpo menor.

O rótulo de seção do cabeçalho vem **sozinho** do heading de seção corrente. Nunca escreva
o nome da seção à mão em um slide.

## Ressalva do logo do laboratório

`assets/logos/lab.png` (1619 × 971 px) tem a faixa "LABORATÓRIO DE PESQUISA" **truncada no
arquivo original**. Corte a faixa inferior com `box(clip: true)` e reescreva a legenda como
texto real logo abaixo — é o que o projeto irmão em LaTeX faz. Não estique, não deforme,
não recrie o logo à mão, não invente outra identidade institucional.

## Componentes disponíveis

Tipos de slide (`config/global.typ`): `slide` (padrão, vem do heading `==`),
`slide-titulo` (capa), `slide-secao` (automático a cada `=`), `slide-estrutural`
(título 44 pt, sem rótulo — Tópicos e Referências), `slide-topicos` (monta-se sozinho
por `query` dos headings de nível 1).

Conteúdo (`config/macros.typ`): `conceito` `alerta` `saida` `desafio` (caixas) ·
`codigo` `comparacao` `demo` (código) · `duas-colunas` `par-rotulado` (layout) ·
`figura` `equacao` `tabela` `citacao` `pacote` (acadêmico) · `dest` `cmd` `espaco`.

**Antes de criar componente novo, verifique se um destes serve.** Caixa nova só se
tiver papel novo — as quatro existentes já cobrem definição, armadilha, saída simulada
e exercício.

Realce de sintaxe: nativo do Typst com a paleta do projeto em `config/codigo.tmTheme`.
Nenhum pacote. Suporta `typ`, `python`, `latex`, `c` e os demais do syntect.

## Densidade e legibilidade

Cada slide responde a **uma** pergunta: o que é / por que existe / como se escreve / quando
usar / qual o resultado. Padrão dominante: **conceito → código curto → resultado**.

| Limite | Valor |
|---|---|
| Linhas de texto por slide | ≤ 8 |
| Linhas de código por bloco | ≤ 12 |
| Menor corpo de texto admitido | 14 pt (nesta página de 960 × 540) |
| Níveis de lista | 2 |

Antes de fechar um slide, pergunte: **isso ajuda o aluno a entender Typst?** Se não ajudar,
remova. Sem gradiente, sem sombra, sem ícone decorativo, sem animação que não revele
informação.

Contraste: `primary` sobre `background` e `texto` sobre branco passam com folga; `secondary`
só em texto de apoio, nunca em conteúdo que o aluno precise ler de longe.

## Slides de código

Todo slide de código responde a três coisas: **o que o código faz**, **qual a ideia
principal** e **onde isso aparece num trabalho acadêmico**. Sempre que couber:
código + explicação + resultado renderizado lado a lado.

## Antes de mexer no tema

Leia `design.md`: ele traz cada medida em pt com a proveniência (o objeto do PDF de onde
saiu). A auditoria do PDF de referência já foi feita — não a repita.
