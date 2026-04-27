# language: pt
Funcionalidade: : Criar Filme
    Como um usuário
    Eu quero registrar um filme novo
    Para que o sistema mostre o meu filme

    #happy path
    Cenário: Ir para a pagina de criação com exito
        Dado que eu estou na pagina inicial
        Quando Eu aperto o botão de adicionar filme
        Então Eu devo ser redirecionado para a pagina de criar filme
        E Eu devo ver os inputs