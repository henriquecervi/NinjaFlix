#language:pt

@login
Funcionalidade: Remover Filme
    Para que eu possa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título cancelado/indesejado ou que não tem uma boa aceitação do público
    Posso remover este item

   
    Cenário: Confirmar Exclusão

        Dado que "dbz" está no catálogo
        Quando eu solicito a exlusão
        E eu confirmo a solicitação
        Então este item deve ser removido do catálogo

    @rm_movie
    Cenário: Cancelar Exclusão

        Dado que "10_coisas" está no catálogo
        Quando eu solicito a exlusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálogo