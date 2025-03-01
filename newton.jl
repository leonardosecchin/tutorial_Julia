using LinearAlgebra, Printf, NLPModels

# Método de Newton
# Entrada: modelo nlp na estrutura NLPModels, x0 ponto inicial (opcional)

function newton(nlp; x0 = nothing, eps = 1e-6, maxiters = 100, saidas = true)
    # lê o número de variáveis da estrutura NLPModels
    n = nlp.meta.nvar

    # Testa se usuário forneceu o ponto inicial. Se não forneceu, inicia na origem
    if isnothing(x0)
        x = zeros(n)
    else
        # aloca vetor solução, copiando x0
        x = deepcopy(x0)
    end

    # contador de iterações
    k = 0

    # computa gradiente e sua norma do infinito
    g = grad(nlp, x)
    norma_g = norm(g, Inf)

    # cabeçalho
    if saidas
        println("Iter  |     norma ∇f |     norma dN")
    end

    while (k <= maxiters)
        # Solução do sistema Newtoniano
        d = hess(nlp, x) \ (-g)

        x .= x + d

        k += 1

        # Atualiza gradiente e norma no novo iterando
        g = grad(nlp, x)
        norma_g = norm(g, Inf)

        # Imprime dados da iteração
        if saidas
            @printf("%5d | %.6e | %.6e\n", k, norma_g, norm(d,Inf))
        end

        # Parar?
        if (norma_g <= eps)
            if saidas
                println()
                println("Problema resolvido com sucesso!")
            end
            # encerra laço while
            break
        end
    end

    # Retorna solução, |∇f|_∞ e número de iterações
    return x, norma_g, k
end
