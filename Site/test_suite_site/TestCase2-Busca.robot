*** Settings ***
Resource        ../resources/Resource.robot
Resource        ../resources/BDDpt-br.robot
Test Setup      Abrir navegador
Test Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Buscar produto
    Dado que esteja na tela de produtos
    Quando pesquisar pela palavra "budweiser"
    Então o item "Budweiser 550ml | Vasilhame Incluso" deve ser listado no resultado da pesquisa

Cenário 02: Adicionar produto na sacola
    Dado que esteja na tela de resultado da pesquisa pelo produto "budweiser"
    Quando clicar no link do produto
    Então o produto deve ser adicionado na sacola

Cenário 03: Pesquisar produto não existente
  Dado que esteja na tela de produtos
  Quando pesquisar por um "produto não existente"
  Então a mensagem "Putz, não conseguimos encontrar o produto "produto não existente"" deve ser mostrada
