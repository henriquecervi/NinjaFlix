#language:pt

@login
Funcionalidade: Remover Filme
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título cancelado/indesejado ou que não tem uma boa aceitação do público
    Posso remover este item

    @rm_movie
    Cenário: Confirmar Exclusão

        Dado que "dbz" está no catálogo
        Quando eu solicito a exlusão
        E eu confirmo a solicitação
        Então este item deve ser removido do catálogo

    Cenário: Cancelar Exclusão

        Dado que "10 coisas que eu odeio em você" está no catálogo
        Quando eu solicito a exclusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálogo