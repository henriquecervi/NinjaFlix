#language: pt

@login
Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com meu e-mail e senha

    # BDD (Desenvolvimento guiado por comportamento)

    @login_happy
    Cenário: Acesso
        Quando eu faço login com "henrique@henrique.com" e "123456"
        Então devo ser autenticado
        E devo ver "Henrique Cervi" na área logada

    @login_hapless
    Esquema do Cenário: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <msg_texto>

        Exemplos:
        |email                       | senha  | msg_texto                      |
        | "henrique@henrique.com.br" | "xpto" | "Usuário e/ou senha inválidos" |
        | "henrique@henrique"        | "xpto" | "Usuário e/ou senha inválidos" |
        | ""                         | "xpto" | "Opps. Cadê o email?"          |
        | "henrique@henrique.com.br" | ""     | "Opps. Cadê a senha?"          |


    
 
 
  