# Checklist de revisão

Arquivo de apoio da skill `compilar-revisar`. Usar na revisão geral (FASE 12) e, em versão
reduzida, ao fechar cada fase.

---

## A. Compilação

- [ ] `typst compile --root . main.typ build/main.pdf` termina sem `error:`
- [ ] Nenhum `warning:` na saída
- [ ] Nenhum aviso de fonte desconhecida (`typst fonts | grep -i calibri` responde)
- [ ] Nenhuma API depreciada em uso
- [ ] Todo pacote importado com **versão fixada** (`@preview/nome:x.y.z`)
- [ ] Todo caminho de arquivo com barra normal `/`, nunca `\`
- [ ] Compila a partir de um clone limpo (nenhuma dependência de arquivo fora do repositório)

## B. Layout de cada slide

- [ ] Nada cortado nas quatro margens
- [ ] Nenhum elemento sobreposto
- [ ] Nenhuma página em branco ou só com título
- [ ] Réguas de cabeçalho e rodapé presentes e do mesmo comprimento em todos os slides de conteúdo
- [ ] Filete vertical do rótulo de seção alinhado em todos os slides
- [ ] Badge `n/N` presente, com o total correto
- [ ] Rótulo de seção correto e vindo do heading, não digitado à mão
- [ ] Capa sem cabeçalho, sem rodapé e sem numeração
- [ ] Logos com proporção original; faixa truncada do `lab.png` não aparece
- [ ] Título de slide em uma linha só (ou quebrado de propósito)

## C. Tipografia e acessibilidade

- [ ] Nenhum texto abaixo de 14 pt
- [ ] Contraste suficiente: `secondary` só em texto de apoio
- [ ] Nenhuma cor usada fora dos tokens de `config/theme.typ`
- [ ] Nenhum hexadecimal literal em `sections/`
- [ ] Nenhum `pt` mágico em `sections/`
- [ ] Ordem de leitura natural: título → conceito → código → resultado
- [ ] Hifenização em português ativa (`lang: "pt"`)

## D. Densidade

- [ ] ≤ 8 linhas de texto por slide
- [ ] ≤ 12 linhas por bloco de código
- [ ] ≤ 2 níveis de lista
- [ ] Cada slide responde a **uma** pergunta
- [ ] Nenhum elemento puramente decorativo

## E. Código nos slides

- [ ] Todo exemplo compila de verdade
- [ ] Todo slide de código responde: o que faz / qual a ideia / onde aparece num trabalho
- [ ] Sintaticamente correto e recortado no trecho relevante
- [ ] Quando possível: código + explicação + resultado
- [ ] Nenhum exemplo depende de arquivo inexistente

## F. Conteúdo técnico

- [ ] Nenhuma função ou parâmetro de Typst inventado
- [ ] Nenhum nome ou versão de pacote inventado (conferir `typst-pacotes/matriz-pacotes.md`)
- [ ] Nenhum pacote apresentado como "oficial do Typst"
- [ ] Cada pacote apresentado traz também quando **não** usar e a limitação
- [ ] Comparação com LaTeX é técnica e equilibrada — sem "guerra"
- [ ] Typst apresentado como alternativa moderna, não como substituto universal do LaTeX

## G. ABNT

- [ ] Nenhuma exigência normativa afirmada sem a NBR nomeada
- [ ] Prática corrente rotulada como prática corrente
- [ ] Requisito institucional rotulado como institucional
- [ ] Decisão do template não apresentada como exigência
- [ ] As quatro camadas (Typst / package / template / ABNT / instituição) explicadas

## H. Referências e links

- [ ] Toda `@referencia` tem destino
- [ ] Nenhum label duplicado
- [ ] Toda URL citada foi verificada
- [ ] Toda fonte factual está registrada em `references/`
- [ ] Nenhum autor, artigo, DOI ou URL inventado
- [ ] Slide de referências em ABNT, com data de acesso no material online

## I. Coerência pedagógica

- [ ] Progressão: nada usa recurso ainda não ensinado
- [ ] Motivação vem antes da sintaxe; ABNT não abre a apresentação
- [ ] Nenhum conteúdo duplicado entre seções
- [ ] Exemplos cobrem Engenharia Elétrica **e** Ciência da Computação
- [ ] Desafios progressivos presentes e resolvíveis com o que já foi ensinado
- [ ] O exemplo final integra título, resumo, seções, figura, tabela, equação, referência
      cruzada, citação e bibliografia
- [ ] A apresentação termina em "agora você consegue montar um trabalho acadêmico"

## J. Arquitetura do código

- [ ] `main.typ` é só entrypoint — imports e montagem, sem conteúdo
- [ ] Nenhuma configuração repetida entre arquivos
- [ ] Nenhuma função duplicada
- [ ] Nomes claros e em português
- [ ] Comentário só onde explica o **porquê**, não o **o quê**
- [ ] Nenhum arquivo vazio criado sem necessidade
- [ ] Seções independentes entre si

---

## Comparação final com o PDF de referência

Coloque lado a lado e confira: capa, um slide de conteúdo, o slide de tópicos e o de
referências.

| Aspecto | Esperado |
|---|---|
| Fundo | #F0F0F0 |
| Réguas | 2 pt, #ED7D31 |
| Filete vertical | 2 pt, #ED7D31, x = 141.4 |
| Badge | borda 1 pt #C55A11 |
| Fonte | Calibri |
| Página | 960 × 540 pt |

Valores completos em `.claude/skills/typst-slides/design.md`.
