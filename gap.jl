using GLPK, JuMP, DelimitedFiles

# Lê a primeira instância de um arquivo TXT
function readGAP(arquivo)
    dados = readdlm(arquivo)

    m, n = Int.(dados[2,1:2])

    p = Int.(dados[ 3:(3+m-1) , 1:n])
    w = Int.(dados[ (3+m):(3+2*m-1) , 1:n])
    t = Int.(dados[ 3+2*m , 1:m ])

    return m, n, p, w, t
end

function solveGAP(p, w, t)
    GAP = Model(GLPK.Optimizer)

    # Lê dimensões a partir de p
    m, n = size(p)

    # Verifica se as dimensões dos dados são compatíveis
    if (size(p) != (m,n)) || (size(w) != (m,n)) || (length(t) != m)
        error("Dados com dimensões incompatíveis!")
    end

    @variable(GAP, x[1:m,1:n], Bin)

    @objective(GAP, Max, sum(p[i,j]*x[i,j] for i in 1:m, j in 1:n))

    for i in 1:m
        @constraint(GAP, sum(w[i,j]*x[i,j] for j in 1:n) <= t[i])
    end

    for j in 1:n
        @constraint(GAP, sum(x[i,j] for i in 1:m) <= 1)
    end

    optimize!(GAP)

    if termination_status(GAP) == OPTIMAL
        # retorna função objetivo e solução
        return objective_value(GAP), value.(x)
    else
        # falha: retorna FO = NaN
        return NaN, []
    end
end
