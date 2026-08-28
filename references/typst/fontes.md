# Fontes — Typst

Base de rastreabilidade do projeto. Toda afirmação factual sobre o Typst nos slides deve
poder ser apontada para uma linha daqui.

Classificação usada: **[F]** fato documentado · **[V]** verificado nesta máquina ·
**[I]** inferência · **[R]** recomendação de projeto.

---

## Documentação oficial

| Fonte | URL | Assunto | Consulta |
|---|---|---|---|
| Typst Documentation | <https://typst.app/docs/> | referência da linguagem | 27/08/2026 |
| Referência — bibliography | <https://typst.app/docs/reference/model/bibliography/> | estilos de citação, formatos de fonte | 27/08/2026 |
| Changelog 0.15.0 | <https://typst.app/docs/changelog/0.15.0/> | mudanças incompatíveis | 27/08/2026 |
| Typst Universe | <https://typst.app/universe/> | pacotes e templates | 27/08/2026 |
| Índice de pacotes (JSON) | <https://packages.typst.org/preview/index.json> | versões e metadados | 27/08/2026 |
| Repositório do compilador | <https://github.com/typst/typst> | releases | 27/08/2026 |

Cópia offline da documentação: `Downloads/typst-documentation.pdf` (27 MB). Consultável sem
rede — usar quando a dúvida for de referência da linguagem.

---

## Ambiente desta máquina

**[V]** Verificado em 27/08/2026.

| Item | Valor | Como foi verificado |
|---|---|---|
| Typst CLI | 0.15.1 (9dfd3a08) | `typst --version` |
| Instalação | WinGet | `where typst` |
| Calibri | presente | `typst fonts` |
| Consolas | presente | `typst fonts` |
| DejaVu Sans Mono | presente | `typst fonts` |
| Libertinus Serif | presente | `typst fonts` |
| New Computer Modern (+ Math) | presente | `typst fonts` |
| Carlito | **ausente** | `typst fonts` |

Consequência **[R]**: usar Calibri, que é a fonte do próprio PDF de referência. O projeto
irmão em LaTeX usava Carlito só por ser métrica-compatível com Calibri — aqui isso não é
necessário.

---

## Estilo de citação ABNT nativo

**[V]** O estilo `associacao-brasileira-de-normas-tecnicas` está **embutido no binário** do
Typst 0.15.1 desta máquina — 3 ocorrências da string em `typst.exe` (52 MB), confirmando o
que a documentação de `bibliography` afirma. **[F]** A doc lista o estilo entre os embutidos.

```typ
#bibliography("referencias.bib", style: "associacao-brasileira-de-normas-tecnicas")
```

**[F]** Formatos de fonte aceitos: `.bib` (BibLaTeX) e `.yml`/`.yaml` (Hayagriva); o
parâmetro `style` também aceita caminho para um `.csl` próprio.

Impacto no projeto **[I]**: referências e citações em ABNT saem sem pacote nenhum. Capa,
folha de rosto, margens e sumário continuam sendo trabalho de template.

---

## Typst 0.15.0 — mudanças que afetam este projeto

**[F]** Da changelog oficial:

| Mudança | Impacto aqui |
|---|---|
| Caminhos com `\` deixaram de ser aceitos | **alto** — Windows; usar sempre `/` |
| Baseline preservada em mais pontos do layout | médio — alinhamentos podem deslocar 1–2 pt |
| `lr.size` resolve sobre o glifo base | baixo |
| Múltiplas bibliografias no mesmo documento | baixo |
| Seletor `within` | baixo |
| Equações exportadas para MathML em HTML | nenhum (saída é PDF) |
| Fontes variáveis com `variations` | nenhum |

**[F]** Releases do compilador: 0.14.2 em 12/12/2025 · 0.15.0 em 15/06/2026 ·
0.15.1 em 17/07/2026.

---

## PDF de referência da identidade visual

`Seminário Relações de Ângulo Barra-Bola v.3.pdf` — apresentação acadêmica do IFMA /
Campus Imperatriz, autoria de João Pedro Lemos Morais, orientação de Ana Angélica Mathias
Macêdo.

**[V]** Medidas extraídas dos content streams em 27/08/2026 — resultado completo em
`.claude/skills/typst-slides/design.md`. Usado como **referência de linguagem visual apenas**;
nenhum conteúdo dele é reaproveitado.

---

## Projeto irmão em LaTeX

`Documents/Euller-LaTeX/` — versão Beamer do mesmo material didático, 14 capítulos.
Fonte da paleta semântica e da anatomia dos slides, **reconferida** contra o PDF acima.
Usado como referência de estrutura pedagógica e de organização de projeto.
