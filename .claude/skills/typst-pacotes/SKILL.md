---
name: typst-pacotes
description: Protocolo de pesquisa e curadoria do Typst Universe — localizar pacote, conferir versão, compilador exigido, categoria, licença, repositório e data, distinguir package de template, avaliar maturidade e registrar a dependência. Use antes de importar qualquer pacote novo, ao escrever os slides sobre Typst Universe e pacotes recomendados, e ao responder "existe um pacote para X?". NÃO use para sintaxe da linguagem (typst-core), regra normativa (typst-abnt) ou decisão de layout do slide (typst-slides). A matriz de pacotes já verificados está em matriz-pacotes.md — consulte antes de pesquisar de novo.
when_to_use: importar pacote novo, "existe pacote para X?", capítulo de Typst Universe, conferir versão ou compatibilidade de pacote, avaliar se um pacote é confiável
---

# Typst Universe — pesquisa e curadoria

## Como consultar (o jeito barato)

O site `typst.app/universe/search` é uma SPA: `WebFetch` nele volta a casca da página, sem
resultados. **Use o índice oficial em JSON**, que é a mesma fonte:

```bash
curl -s https://packages.typst.org/preview/index.json
```

São ~2 MB com **todas** as versões de **todos** os pacotes. Nunca despeje isso no contexto —
filtre. Uma consulta por nome, pegando a versão mais alta de cada pacote:

```bash
curl -s https://packages.typst.org/preview/index.json | python -c "
import json,sys
d=json.load(sys.stdin); best={}
for p in d:
    n=p['name']; v=tuple(map(int,p['version'].split('.')))
    if n not in best or v>tuple(map(int,best[n]['version'].split('.'))): best[n]=p
for n,p in sorted(best.items()):
    if 'PALAVRA' in (n+' '+p.get('description','')).lower():
        print(n, p['version'], '| compilador>=', p.get('compiler','?'),
              '|', p.get('license'), '|', p.get('repository',''))
"
```

Campos úteis de cada entrada: `name`, `version`, `description`, `compiler` (versão mínima do
Typst), `categories`, `disciplines`, `license`, `repository`, `keywords`.

A página individual (`typst.app/universe/package/<nome>/`) já responde a `WebFetch` e é onde
está a documentação de uso e a data da última atualização.

## Antes de importar — checklist obrigatório

| # | Verificação | Reprova se |
|---|---|---|
| 1 | Versão mais recente | você fixou uma versão antiga sem motivo |
| 2 | `compiler` ≤ **0.15.1** | exige compilador mais novo que o nosso |
| 3 | Data da última atualização | parado há muito tempo **e** há alternativa viva |
| 4 | Repositório acessível | sem repositório público |
| 5 | Documentação real | só um README de uma linha |
| 6 | Licença | incompatível com o uso do projeto |
| 7 | Compila de fato | falha no smoke test |

O item 7 não é opcional: **compile um exemplo mínimo antes de afirmar que o pacote
funciona.** Metadado no índice não é prova de compatibilidade.

## Package × Template — a distinção que confunde

| | Package | Template |
|---|---|---|
| Para que serve | funcionalidade reutilizável | ponto de partida de um documento |
| Como se usa | `#import "@preview/nome:versão": *` | `typst init @preview/nome` |
| O que produz | funções que você chama | uma pasta com arquivos já montados |
| Depois de usar | continua sendo dependência | o código passa a ser seu |

Os dois moram no mesmo Universe e a busca mistura os dois. No slide, deixe explícito: o
template você **adota e edita**; o package você **importa e mantém atualizado**.

## Regras de honestidade

- **Nenhum pacote do Universe é "oficial do Typst".** O Universe é um registro aberto;
  estar lá não significa endosso. Só o compilador e a documentação em `typst.app/docs` são
  oficiais.
- Versão **sempre** escrita no import — é o que torna o documento reprodutível.
- Não inclua pacote que o projeto não usa de verdade.
- Ao apresentar um pacote, diga também **quando não usar** e a **limitação**. Lista de
  pacotes sem crítica não é curadoria.
- Todo pacote adotado entra em `references/packages/` com nome, versão, data de consulta,
  para que serve e por que foi escolhido.

## Categorias do Universe

Úteis para ensinar a navegar: Presentation, Paper, Thesis, Report, Book, Visualization,
Layout, Text, Model, Components, Scripting, Utility, Integration, Fun. Há também filtro por
disciplina (engenharia, computação, matemática, física, …).

## Ver também

`matriz-pacotes.md`: versões já verificadas em 27/08/2026, com problema resolvido, quando
usar, quando não usar e limitações de cada pacote curado — incluindo o panorama dos pacotes
ABNT brasileiros.
