---
name: compilar-revisar
description: Ciclo canônico de build e validação da apresentação — typst compile, varredura de warnings, renderização das páginas em PNG e inspeção visual contra o PDF de referência, com critérios de aceite. Use sempre que alterar config/, main.typ ou qualquer arquivo de sections/, e obrigatoriamente antes de declarar qualquer fase concluída. Nunca considere um slide pronto só porque o código foi escrito — ele precisa compilar e ser olhado. Use também para a revisão geral final (overflow, contraste, densidade, links, coerência dos exemplos, duplicação).
when_to_use: terminei de escrever slides, validar antes de fechar fase, revisão geral, verificar overflow ou erro de compilação, comparar com o PDF de referência
allowed-tools: Bash Read Glob Grep
---

# Compilar e revisar

Fluxo obrigatório deste projeto. Nunca valide "no olho": sempre **build → warnings →
render → inspeção**. Código escrito não é fase concluída.

## 1. Build

```bash
typst compile --root . main.typ build/main.pdf
```

Durante o desenvolvimento, recompilação automática:

```bash
typst watch --root . main.typ build/main.pdf
```

`--root .` é necessário porque as seções importam de `config/` e `assets/`, fora da pasta
do arquivo compilado.

## 2. Warnings

O Typst falha na hora em erro, mas **warning passa batido** — leia a saída sempre. Não
existe arquivo de log: capture a saída do comando.

| Achado | Tolerância |
|---|---|
| `error:` | zero |
| `warning: unknown font family` | **zero** — a fonte não existe e o texto saiu com fallback |
| `warning: layout did not converge` | zero — há dependência circular em `context` |
| `warning: ... is deprecated` | zero — API mudou, corrigir agora |
| Label não referenciado | tolerável |

Fonte ausente é o warning mais perigoso aqui: o PDF **compila igual**, só que com a fonte
errada, e a diferença passa despercebida na leitura do código. Confira:

```bash
typst fonts | grep -iE "calibri|consolas"
```

## 3. Render e inspeção visual

```bash
typst compile --root . --format png --ppi 100 main.typ "build/pg-{n}.png"
typst compile --root . --format png --ppi 100 --pages 3-6 main.typ "build/pg-{n}.png"
```

Leia as PNGs geradas. Procure por, nesta ordem:

1. **Overflow** — texto ou código passando da margem, equação estourando a largura.
2. **Sobreposição** — elemento por cima de outro, conteúdo sob o rodapé.
3. **Página vazia** ou slide com só o título.
4. **Cabeçalho e rodapé** — rótulo de seção correto, badge `n/N` consistente, réguas
   presentes e do mesmo comprimento em todos os slides de conteúdo.
5. **Logos** — proporção preservada, sem distorção, sem faixa truncada aparecendo.
6. **Densidade** — mais de 8 linhas de texto ou mais de 12 linhas de código é slide cheio.
7. **Legibilidade** — nada abaixo de 14 pt nesta página de 960 × 540.

Comparação obrigatória: `Seminário Relações de Ângulo Barra-Bola v.3.pdf`. As medidas
esperadas estão em `.claude/skills/typst-slides/design.md` — não remeça o PDF de referência.

## 4. Onde corrigir

- Defeito em **mais de um slide** → corrija em `config/`.
- Defeito em **um slide só** → corrija no arquivo daquela seção.

Nunca aplique o mesmo remendo em vários arquivos. Se o remendo se repete, o lugar dele é o
tema.

## 5. Revisão de conteúdo

Além do visual, antes de fechar uma fase:

- Todo exemplo de código **compila** — se está no slide, foi testado.
- Nenhum nome de pacote ou versão inventado; conferir com `typst-pacotes`.
- Nenhuma exigência ABNT afirmada sem NBR nomeada; conferir com `typst-abnt`.
- Nenhum link quebrado; nenhuma referência `@x` sem destino.
- Nenhum conteúdo duplicado entre seções.
- Progressão pedagógica: o slide N não usa recurso que só será ensinado em N+3.

Ver `checklist.md` para a lista completa de revisão final.

## 6. Economia

Renderize só o intervalo de páginas afetado. Não recompile sem ter mudado nada. Não releia
arquivo cujo conteúdo já está no contexto. Não repita a auditoria do PDF de referência.
