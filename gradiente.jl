using LinearAlgebra, Printf, NLPModels

# Método do gradiente com backtracking
# Entrada: modelo nlp na estrutura NLPModels, x0 (opcional), eta (opcional)

function gradiente(nlp; x0 = nothing, eps = 1e-6, eta = 1e-4, maxiters = 100, saidas = true)
    # lê o número de variáveis da estrutura NLPModels
    n = nlp.meta.nvar

    # Testa se usuário forneceu o ponto inicial. Se não forneceu, inicia na origem
    if isnothing(x0)
        x = zeros(n)
    else
        # aloca vetor solução, copiando x0
        x = deepcopy(x0)
    end

    # aloca x^{k+1}
    xnew = similar(x)

    # contador de iterações
    k = 0

    # cabeçalho
    if saidas
        println("Iter  |     norma ∇f |            t")
    end

    # inicializa variáveis fora do laço while
    norma_g = Inf
    t = 1

    while (k <= maxiters)
        # Direção
        d = -grad(nlp, x)

        norma_g = norm(d, Inf)

        # Imprime dados da iteração
        if saidas
            @printf("%5d | %.6e | %.6e\n", k, norma_g, t)
        end

        # Parar?
        if (norma_g <= eps)
            if saidas
                println()
                println("Problema resolvido com sucesso!")
            end
            break
        end

        t = 1
        f = obj(nlp, x)   # f(x^k)
        xnew .= x + t*d   # x^{k+1} = x^k + t*d^k
        fnew = obj(nlp, xnew)  # f(x^k + t*d^k) = f(x^{k+1})

        # Busca linear
        gtd = -d'*d    # d = -grad f,  grad f^t*d = -d^t*d
        while fnew > f + eta * t * gtd
            t = t/2
            xnew .= x + t*d
            fnew = obj(nlp, xnew)
        end

        k += 1

        # Atualiza x para próxima iteração
        x .= xnew
    end

    # Retorna solução, |∇f|_∞ e número de iterações
    return x, norma_g, k
end
