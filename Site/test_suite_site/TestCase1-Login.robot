*** Settings ***
Resource        ../resources/Resource.robot
Resource        ../resources/BDDpt-br.robot
Test Setup      Abrir navegador
Test Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Login
    Dado que esteja na tela HOME do site
    Quando clicar no botão entrar
    Então o login deve ser realizado com sucesso

Cenário 02: E-mail inválido
    Dado que esteja na tela de Login
    Quando inserir um e-mail inválido
    Então a mensagem "Eita, esse e-mail não parece correto" deve ser exibida

Cenário 03: Senha inválida
    Dado que esteja na tela de Login
    Quando não inserir uma senha
    Então a mensagem "O campo senha não pode ficar vazio" deve ser exibida
