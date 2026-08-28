# CLAUDE.md — Apresentação "Typst para Engenharia e Produção Acadêmica"

## Objetivo e público

Apresentação 16:9 em **pt-BR** que ensina Typst a estudantes de Engenharia Elétrica e
Ciência da Computação, de "por que isto existe?" até "como montar um trabalho acadêmico em
ABNT". Identidade visual do IFMA / Campus Imperatriz, replicando o padrão de
`Seminário Relações de Ângulo Barra-Bola v.3.pdf`. Público: graduando que nunca usou Typst e
provavelmente sofreu com Word ou LaTeX.

## Princípios pedagógicos

1. Motivação antes de sintaxe. ABNT **não** abre a apresentação: entra no meio.
2. Cada slide responde a **uma** pergunta: o que é / por que existe / como se escreve /
   quando usar / qual o resultado. Padrão dominante: **conceito → código curto → resultado**.
3. Nenhum slide usa recurso que ainda não foi ensinado.
4. Exemplos dos dois cursos: realistas, pequenos e compiláveis.
5. Comparação com LaTeX técnica e equilibrada. Typst é **alternativa moderna**, não
   substituto universal.

## Arquitetura

```
main.typ                entrypoint — imports e montagem, nada de conteúdo
config/theme.typ        ÚNICO ponto de verdade visual: cores, tipografia, geometria (dados)
config/componentes.typ  moldura: cabeçalho, rodapé, badge, capa — posição absoluta
config/macros.typ       componentes de conteúdo: caixas, código, tabela, figura…
config/codigo.tmTheme   paleta do realce de sintaxe
config/global.typ       liga tudo ao touying; devolve a função `apresentacao`
config/metadata.typ     título, autor, orientador, local, data, logos
sections/NN-nome        uma seção por arquivo, independentes entre si
assets/ examples/       logos e imagens · exemplos e galeria de componentes
references/             rastreabilidade: typst/, packages/, abnt/
.claude/skills/         conhecimento especializado, carregado sob demanda
```

Compilador **Typst 0.15.1** · motor de slides **touying 0.7.4** (smoke test aprovado).

## Regras de desenvolvimento

1. **Toda** cor, fonte, tamanho, espaçamento e componente vive em `config/`.
   Nenhum hexadecimal e nenhum `pt` mágico dentro de `sections/`.
2. Defeito em mais de um slide → conserta em `config/`. Local → conserta na seção.
   Nunca replique o mesmo remendo.
3. Seções independentes: nada de uma depender de macro definida em outra.
4. Antes de criar arquivo ou pasta, verifique se é necessário. Simplicidade primeiro.
5. Não adicione pacote sem uso real no slide. Comentário só onde explica o **porquê**.

## Regras de Typst

Sintaxe e semântica: skill `typst-core`. Específico deste projeto:

- Caminho **sempre** com barra normal — desde a 0.15 o `\` não é aceito, nem no Windows.
- Import de pacote **sempre** com versão fixada: `@preview/nome:0.0.0`.
- `theme.typ` exporta só **dados**; a moldura mora em `componentes.typ`; o wiring do
  touying, em `global.typ`.
- A moldura é desenhada por `place` absoluto no `background` da página, não pelo fluxo —
  é o que faz régua, filete e badge caírem nas coordenadas medidas.
- Lista de fontes só com famílias instaladas — `unknown font family` é warning bloqueante.
- **Nunca use `---` para quebrar slide.** É travessão em português, e o touying o converte
  em quebra de página por padrão (aqui a opção está desligada). Para quebrar: `#pagebreak()`.

## Regras de ABNT

Detalhe: skill `typst-abnt`. A regra que não se negocia:

**Nunca afirme exigência ABNT sem nomear a NBR.** Toda afirmação normativa é rotulada como
norma, interpretação, requisito institucional ou decisão estética do template. Sem poder
apontar onde está escrito, apresente como prática corrente — ou pesquise antes.
O estilo de citação ABNT é **nativo do compilador**; capa e folha de rosto não são.

## Referências e pesquisa

Toda afirmação factual sobre Typst, pacote ou norma aponta para uma linha de `references/`,
com URL, assunto e data. **Não inventar autor, artigo, DOI, URL, função de Typst, parâmetro
ou versão de pacote.** Prioridade das fontes: documentação oficial → repositório oficial →
doc do pacote → exemplos oficiais; snippet aleatório da internet não é fonte primária.
Sempre diferencie fato documentado, comportamento observado, recomendação e inferência.
Para o Typst Universe, consulte `packages.typst.org/preview/index.json`, não o site de
busca (é SPA).

## Uso de Skills

`typst-core` escrever/corrigir `.typ` e erro de compilação · `typst-academico` estrutura de
trabalho acadêmico · `typst-abnt` exigência normativa, citação e bibliografia ·
`typst-slides` criar slide, mexer no tema, cor/tamanho/espaço · `typst-pacotes` importar
pacote e capítulo do Universe · `compilar-revisar` fechar qualquer bloco de trabalho.

O corpo da skill fica em contexto até o fim da sessão: invoque a que resolve, não todas.
Documentação extensa vive nos arquivos de apoio — leia só quando precisar.

## Revisão

Nunca declare pronto porque o código foi escrito. Ciclo obrigatório:

```bash
mkdir -p build                                    # o typst não cria o diretório
typst compile --root . main.typ build/main.pdf    # exit 0 e ZERO warnings
typst compile --root . --format png --ppi 100 --pages N-M main.typ "build/pg-{n}.png"
```

Depois **olhe as PNGs**: overflow, sobreposição, página vazia, rodapé e badge consistentes,
logo sem distorção. Critérios completos em `compilar-revisar/checklist.md`.

## Tokens

`CLAUDE.md` é constituição, não manual — conhecimento extenso vai para skill. Não duplique
informação entre `CLAUDE.md`, skills e código. Não releia arquivo já em contexto. Busca
cirúrgica em vez de varrer o repositório. Compile só após alteração relevante; renderize só
o intervalo afetado. **Não repita a auditoria do PDF de referência** — as medidas estão em
`.claude/skills/typst-slides/design.md`.

## Workflow incremental

O projeto avança em fases, **uma por vez**. Ao terminar: mostre o que foi feito, arquivos
criados, decisões, problemas e próximo passo. Então **pare** e pergunte
"FASE X concluída. Posso prosseguir para a FASE Y?". **Nunca avance sem autorização.**

Commits atômicos, um por unidade lógica, mensagem em pt-BR explicando o **porquê**.

Fases: 1 skills ✓ · 2 arquitetura ✓ · 3 CLAUDE.md ✓ · 4 sistema visual ✓ · 5 componentes ✓ ·
6 fundamentos ✓ · 7 sintaxe ✓ · 8 elementos ✓ · 9–11 (ABNT → pacotes → artigo final) ·
12 revisão · 13 build final.
