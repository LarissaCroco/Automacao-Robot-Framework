*** Settings ***
Resource        ../resources/Resource.robot
Resource        ../resources/BDDpt-br.robot
Test Setup      Abrir navegador
Test Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Alterar a quantidade
    Dado que esteja na sacola
    Quando acrescentar 1 unidade
    Então a quantidade deve ser alterada

Cenário 02: Remover item da sacola
    Dado que esteja na sacola
    Quando clicar na lixeira
    Então a mensagem "Você deseja remover este produto?" deve ser exibida
    E o item "Budweiser 550ml | Vasilhame Incluso" deve ser excluído
