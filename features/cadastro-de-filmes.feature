#language:pt

@login
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

@campos_obrigatorios
Esquema do Cenario: Campos Obrigatórios
    O gestor de catálogo tenta cadastrar um novo filme, mas esquece
    de preencher um dos campos obrigatórios, em seguida, o sistema
    exibe uma notificação para o mesmo.

    Dado que <filme> é um novo filme
    Quando eu faço o cadastro deste filme
    Então devo ter a notificação <texto>

Exemplos:
    | filme       | texto                                                  |
    | "no_title"  | "Oops - Filme sem titulo. Pode isso Arnaldo?"          |
    | "no_status" | "Oops - O status deve ser informado!"                  |
    | "no_year"   | "Oops - Faltou o ano de lançamento também!"            |
    | "no_date"   | "Oops - Quase lá, só falta a data de estréia!"         |
        
@dup_movie
Cenário: Duplicado
    O gestor de catálogo tenta cadastrar um novo filme, porém o título
    já fora cadastrado em outro momento e o sistema notifica o usuário
    informando que o título já existe.

    Dado que "deadpool2" é um novo filme
    Mas este filme já exite no catálogo
    Quando eu faço o cadastro deste filme
    Então devo ter a notificação "Oops - Este titulo já existe no Ninjaflix."




        
