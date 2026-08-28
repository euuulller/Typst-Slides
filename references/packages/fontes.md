# Fontes — pacotes do Typst Universe

Registro de dependências e de curadoria. A análise (para que serve, quando usar, quando não
usar, limitações) fica em `.claude/skills/typst-pacotes/matriz-pacotes.md`; aqui ficam
**proveniência e data**.

**Consulta:** 27/08/2026 · **Método:** `https://packages.typst.org/preview/index.json`,
tomando a maior versão publicada de cada pacote · **Compilador alvo:** Typst 0.15.1.

---

## Versões apuradas

| Pacote | Versão | `compiler` mínimo | Licença | Repositório |
|---|---|---|---|---|
| touying | 0.7.4 | 0.12.0 | MIT | github.com/touying-typ/touying |
| polylux | 0.4.0 | — | MIT | github.com/polylux-typ/polylux |
| diatypst | 0.9.3 | 0.12.0 | MIT-0 | github.com/skriptum/Diatypst |
| presentate | 0.2.6 | 0.13.0 | MIT | github.com/pacaunt/typst-presentate |
| cetz | 0.5.2 | 0.14.0 | LGPL-3.0-or-later | github.com/cetz-package/cetz |
| cetz-plot | 0.1.4 | 0.13.1 | LGPL-3.0-or-later | github.com/cetz-package/cetz-plot |
| fletcher | 0.5.8 | 0.13.0 | MIT | github.com/Jollywatt/typst-fletcher |
| circuiteria | 0.2.1 | 0.13.1 | Apache-2.0 | git.kb28.ch/HEL/circuiteria |
| codly | 1.3.0 | 0.12.0 | MIT | github.com/Dherse/codly |
| zebraw | 0.6.3 | 0.14.0 | MIT | github.com/hongjr03/typst-zebraw |
| unify | 0.8.1 | — | MIT | github.com/ChHecker/unify |
| physica | 0.9.8 | 0.14.0 | MIT | github.com/Leedehai/typst-physics |
| equate | 0.3.3 | 0.14.0 | MIT | github.com/EpicEricEE/typst-equate |
| ctheorems | 1.1.3 | — | MIT | github.com/sahasatvik/typst-theorems |
| lovelace | 0.3.1 | 0.13.0 | MIT | github.com/andreasKroepelin/lovelace |
| algorithmic | 1.0.7 | 0.13.0 | MIT | github.com/typst-community/typst-algorithmic |
| glossarium | 0.5.10 | 0.13.0 | MIT | github.com/typst-community/glossarium |
| subpar | 0.2.2 | 0.12.0 | MIT | github.com/tingerrr/subpar |
| hydra | 0.6.3 | 0.12.0 | MIT | github.com/tingerrr/hydra |
| min-book | 1.5.1 | 0.15.0 | MIT-0 | github.com/mayconfmelo/min-book |

Campo `compiler` vazio significa **ausente no índice** (pacote publicado antes de o campo
existir), não "sem requisito".

---

## Universo ABNT / Brasil

Busca por `abnt`, `brazil`, `brasil` e `portugu` nos nomes, descrições e palavras-chave do
índice. Resultado completo em 27/08/2026:

| Pacote / template | Versão | Repositório |
|---|---|---|
| abntyp | 0.1.5 | github.com/3sdras/abntyp |
| quati-abnt | 0.1.0 | github.com/gabdumal/quati_abnt |
| min-article | 0.1.0 | github.com/mayconfmelo/min-article |
| classic-ppgsi | 0.1.0 | github.com/ppgsi-lab/classic-ppgsi |
| ufscholar | 0.2.0 | github.com/MarkV43/ufscholar |
| ufpr-unofficial | 2022.1.0 | github.com/chrispdobb/ufpr-unofficial |
| utfpr-tcc-unofficial | 0.1.0 | github.com/Thales3006/utfpr-tcc-unofficial |
| uepg-tcc-unofficial | 0.1.0 | github.com/ekspy/uepg-tcc-unofficial |
| ferrmat | 0.1.2 | github.com/3sdras/ferrmat |
| bellbird-udesc-paper | 0.0.1 | github.com/lucas-bublitz/bellbird-udesc-paper |
| curriculo-acad | 0.1.2 | github.com/philkleer/curriculo-acad |
| klaro-ifsc-sj | 0.1.0 | github.com/gabrielluizep/klaro-ifsc-sj |

Observação registrada: exceto `ufpr-unofficial` (versionado por ano) e `min-book`, **todos
estão abaixo de 1.0**, e três trazem "unofficial" no próprio nome.

---

## Touying — compatibilidade resolvida

- Release 0.7.4 publicado em **06/06/2026**; Typst 0.15.0 em **15/06/2026**. O pacote é
  **9 dias anterior** ao compilador — daí o risco levantado na FASE 1.
- Busca por issues com "0.15" no título no repositório do touying: **0 resultados**
  (27/08/2026). Ausência de issue não é prova, por isso o smoke test.
- Mudanças recentes relevantes: 0.7.3 alterou o comportamento de `#speaker-note` e passou
  `receive-body-for-new-section-slide-fn` a `false` por padrão; 0.7.4 mudou o padrão de
  `lazy-layout` para `cols`.

**[V] Smoke test em 27/08/2026 — compila limpo no Typst 0.15.1.** Exit 0, nenhum warning,
nenhum aviso de API depreciada. Verificado funcionando:

| Recurso testado | Resultado |
|---|---|
| `touying-slides` + `config-page` com 960 × 540 pt | `/MediaBox[0 0 960 540]` no PDF |
| `config-info` | ok |
| `#pause` (subslides) | ok |
| `#context` + `here().page()` + `counter(page).final()` | ok |
| Dependência transitiva `@preview/uniwarn:0.1.1` | baixada automaticamente |

Risco encerrado: o plano B (tema em Typst puro) **não é necessário**.

---

## Dependências efetivamente adotadas

Um pacote só entra nesta tabela depois de compilar neste projeto.

| Pacote | Versão fixada | Onde é usado | Verificado em |
|---|---|---|---|
| touying | 0.7.4 | `config/global.typ` | 27/08/2026 |
| uniwarn | 0.1.1 | transitiva do touying | 27/08/2026 |
