# Typst para Engenharia e Produção Acadêmica

Apresentação didática que ensina [Typst](https://typst.app) a estudantes de Engenharia
Elétrica e Ciência da Computação, do "por que isto existe?" até "como montar um trabalho
acadêmico em ABNT".

**76 slides**, 16:9, em português, com identidade visual do IFMA — Campus Imperatriz.
Junto vai um **artigo acadêmico completo e compilável**, para o aluno usar como ponto de
partida.

---

## Como compilar

Requer [Typst 0.15.1](https://github.com/typst/typst/releases) ou superior.

```bash
mkdir -p build

# a apresentação
typst compile --root . main.typ build/main.pdf

# o artigo acadêmico completo (3 páginas, ABNT)
typst compile --root . examples/artigo/artigo.typ build/artigo.pdf

# a galeria de componentes do tema
typst compile --root . examples/galeria.typ build/galeria.pdf
```

Para escrever com o PDF atualizando ao lado:

```bash
typst watch --root . main.typ build/main.pdf
```

O `--root .` é necessário porque as seções importam de `config/` e `assets/`.
As dependências são baixadas e postas em cache na primeira compilação — não há "instalar
pacote".

### Fontes

A apresentação usa **Calibri** (a fonte do modelo institucional) e **Consolas**, ambas
presentes em Windows. Em Linux ou macOS, instale a **Carlito** — que é
métrica-compatível com a Calibri — e acrescente-a à lista em
[`config/theme.typ`](config/theme.typ).

Fonte ausente **não** quebra a compilação: o Typst emite um `warning: unknown font
family` e segue com uma fonte substituta. Leia a saída do compilador.

---

## O que a apresentação cobre

| Seção | Conteúdo |
|---|---|
| **Fundamentos** | o problema da produção acadêmica · editor visual × LaTeX × Typst · o que é e como funciona · instalação · primeiro documento · os três modos |
| **Sintaxe** | estrutura e numeração · `set` e `show` · onde a configuração mora · listas |
| **Elementos** | imagens e figuras · tabelas · matemática |
| **ABNT** | bibliografia · citações · as cinco camadas (Typst / package / template / ABNT / instituição) |
| **Prática** | Typst Universe · curadoria de pacotes · artigo completo · conclusão |

Cada capítulo termina em um desafio. A comparação com LaTeX é técnica e equilibrada: há um
slide dedicado a **quando ficar no LaTeX**.

---

## Estrutura

```
main.typ                  entrypoint — só imports e montagem
config/
  theme.typ               ÚNICO ponto de verdade visual (cores, medidas, tipografia)
  componentes.typ         a moldura: cabeçalho, rodapé, badge, capa
  macros.typ              componentes de conteúdo: caixas, código, tabela, figura…
  global.typ              liga tudo ao touying
  metadata.typ            título, autor, orientador, local, data
  codigo.tmTheme          paleta do realce de sintaxe
sections/01..16           uma seção por arquivo, independentes entre si
examples/
  artigo/                 artigo acadêmico completo e compilável
  abnt/                   demonstração do estilo ABNT nativo
  galeria.typ             todos os componentes do tema, lado a lado
references/               rastreabilidade: fontes de Typst, pacotes e ABNT
```

**Para trocar título, autor ou orientador**, edite apenas
[`config/metadata.typ`](config/metadata.typ). **Para trocar o visual inteiro**, apenas
[`config/theme.typ`](config/theme.typ) — nenhuma seção precisa ser tocada.

---

## Dependências

Uma só: [`touying`](https://github.com/touying-typ/touying) 0.7.4, o motor de slides.

O realce de sintaxe, as tabelas, a matemática e **o estilo de citação ABNT** são nativos
do compilador. Em particular:

```typ
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

não precisa de pacote nenhum.

---

## Sobre a ABNT

O material distingue, em todos os slides, quatro coisas que costumam ser confundidas:

- o que é **norma** (com a NBR nomeada),
- o que é **interpretação da norma**,
- o que é **requisito da instituição**,
- o que é **decisão estética do template**.

Valores de formatação que circulam em manuais de TCC (margens, corpo, recuo de citação
longa) aparecem rotulados como **prática corrente**, não como exigência — confira sempre o
manual do seu curso. As pendências de confirmação estão listadas em
[`references/abnt/fontes.md`](references/abnt/fontes.md).

---

## Créditos

A identidade visual reproduz o padrão de uma apresentação anterior do Laboratório de
Pesquisa (Biologia, Física, Química e Materiais) do IFMA — Campus Imperatriz. As medidas
foram extraídas do PDF original e estão documentadas em
`.claude/skills/typst-slides/design.md`.

Os logotipos em `assets/logos/` são das respectivas instituições e são usados sem
alteração de proporção.
