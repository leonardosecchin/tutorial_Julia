using LinearAlgebra

# Gradiente conjugados
# A, b e x0 são parâmetros obrigatórios
# eps é parâmetro opcional, cujo valor padrão é 10^{-8}
# maxiters é parâmetro opcional, cujo valor padrão é 100
function cg(A, b, x0; eps = 1e-8, maxiters = 100, saidas = true)
    # captura dimensão de A
    n = size(A,1)

    # aloca vetores na memória
    x = deepcopy(x0)
    r = similar(x)
    p = similar(x)
    w = similar(x)

    # inicialização
    r .= A*x - b
    p .= -r
    k = 0
    norma_r = norm(r)

    # laço principal
    while (norma_r > eps) && (k <= maxiters)
        w .= A*p
        alpha = (r'*r) / (p'*w)
        x .= x + alpha*p
        rtr_old = r'*r
        r .= r + alpha*w
        beta = (r'*r) / rtr_old
        p .= -r + beta*p
        norma_r = norm(r)
        k += 1
        if saidas
            println("Iteração $(k): norma resíduo = $(norma_r)")
        end
    end

    # retorna solução, norma de r e número de iterações
    return x, norma_r, k
end