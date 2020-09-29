#language:pt

Funcionalidade: Cadastro de Filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

#scenario outline... quando o cenário fica muito simples, é ideal inserir mais infos.
    @new_movie
    Esquema do Cenario: Novo Filme
        O gestor de catálogo deseja cadastrar um novo filme através do formulário
        e um novo registro é inserido no catálogo Ninjaflix.

        Dado que <filme> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver o novo filme na lista

    Exemplos:

        | filme      |
        | "ultimato" |
        | "spider"   |
        | "joker"    |

        
