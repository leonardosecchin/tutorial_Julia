# Introdução à linguagem Julia aplicada à otimização - Pacotes extras

## Plots

- [`LaTeXStrings.jl`](https://github.com/JuliaStrings/LaTeXStrings.jl). Textos em LaTeX (útil para escrever LaTeX em plots).
- [`UnicodePlots.jl`](https://github.com/JuliaPlots/UnicodePlots.jl). Plots simples no terminal Julia.
- [`Makie.jl`](https://github.com/MakieOrg/Makie.jl). Rico ecossistema para plots interativos e animados.
- [`Interact.jl`](https://github.com/JuliaGizmos/Interact.jl). Cria plots interativos (widget).
- [`StatsPlots.jl`](https://github.com/JuliaPlots/StatsPlots.jl). Vários tipos de gráficos prontos, tais como boxplot, violin plot, histogramas etc. Atualmente, este pacote foi integrado ao `Plots.jl.

## Formatação

- `Printf.jl`. Impressão estilo C.
- [`Format.jl`](https://github.com/JuliaString/Format.jl). Formatação estilo C (mais eficiente que Printf).
- [`Latexify.jl`](https://github.com/korsbo/Latexify.jl). Converte objetos Julia em código LaTeX.

## Otimização

- [`LineSearches.jl`](https://github.com/julianlsolvers/linesearches.jl). Buscas lineares prontas para uso.
- [`QuadraticModels.jl`](https://github.com/JuliaSmoothOptimizers/QuadraticModels.jl). Escrita de modelos de otimização quadráticos no formato `NLPModels` com cálculo eficiente de derivadas.
- [`RipQP.jl`](https://github.com/JuliaSmoothOptimizers/RipQP.jl). Um método eficiente de pontos interiores para programação linear e quadrática que usa `QuadraticModels.jl.
- [`HiGHS.jl`](https://github.com/jump-dev/HiGHS.jl). Interface para [HiGHS](https://highs.dev/), um *solver* livre para programação linear.
- [`ExaModels.jl`](https://github.com/exanauts/ExaModels.jl). Modelos de otimização ao estilo `NLPModels` que permite computar derivadas automáticas em paralelo, incluindo em GPUs, de forma eficiente.
- [`SCIP.jl`](https://github.com/scipopt/SCIP.jl). Interface para [SCIP](https://scipopt.org/), um *solver* livre para problemas de programação linear inteira mista.

## Operações com vetores e matrizes

- [`Distances.jl`](https://github.com/JuliaStats/Distances.jl). Cálculo de distâncias entre vetores com várias métricas.
- [`LazyArrays.jl`](https://github.com/JuliaArrays/LazyArrays.jl). *Lazy arrays* no Julia.

## Paralelismo

- [`CUDA.jl`](https://github.com/juliagpu/cuda.jl). Habilita paralelismo em GPUs NVidia (CUDA).
- [`AMDGPU.jl`](https://github.com/JuliaGPU/AMDGPU.jl). Habilita paralelismo em GPUs AMD.
- [`Distributed.jl`](https://github.com/JuliaLang/Distributed.jl). Paralelismo distribuído (não é adequado para paralelismo *multithread*. Para isso, use o `Threads` nativo do Julia).

## Geral

- [`ArgParse.jl`](https://github.com/carlobaldassi/ArgParse.jl). Pacote para interpretar argumentos passados em linha de comando do Linux/Windows.
- [`Revise.jl`](https://github.com/timholy/Revise.jl). Re-inclusão/Recompilação automática de códigos em arquivos modificados.
- [`Distributions.jl`](https://github.com/juliastats/distributions.jl). Distribuições de probabilidade prontas para uso em conjunto com o comando `rand.
- `Random.jl`. Comandos avançados de randomização, tais como permutações randomizadas, embaralhamento etc.

