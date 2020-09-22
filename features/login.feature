#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com meu e-mail e senha

    # BDD (Desenvolvimento guiado por comportamento)

    @login_happy
    Cenário: Acesso
        Quando eu faço login com "henrique@henrique.com.br" e "bernardo"
        Então devo ser autenticado
        E devo ver "Henrique Cervi" na área logada

    Cenário: Senha inválida
        Quando eu faço login com "henrique@henrique.com.br" e "oioi"
        Então não devo ser autenticado
        E devo ver a mensagem de alerta "Usuário e/ou senha inválido"

    Cenário: Usuário não existe
        Quando eu faço login com "henrique@henrique" e "oioi"
        Então não devo ser autenticado
        E devo ver a mensagem de alerta "Usuário e/ou senha inválido"

    Cenário: Email não informado
        Quando eu faço login com "" e "oioi123"
        Então não devo ser autenticado
        E devo ver a mensagem de alerta "Opps. Cadê o email?"

    Cenário: Senha não informada
        Quando eu faço login com "henrique@henrique" e ""
        Então não devo ser autenticado
        E devo ver a mensagem de alerta "Opps. Cadê a senha?"