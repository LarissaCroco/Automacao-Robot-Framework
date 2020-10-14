*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${BROWSER}                chrome
${URL}                    https://www.ze.delivery
${CABEÇALHO}              css=.css-wnpw40-headerContent > figure:nth-child(1) > img:nth-child(1)
${SACOLA}                 css=#pre-checkout
${CAMPO_PESQUISAR}        css=#search-product-input
${BOTAO_ADICIONAR}        css=#add-product
${EMAIL}                  css=#login-mail-input-email
${PASSWORD}               css=#login-mail-input-password
${BOTAO_ENTRAR_HOME}      css=#welcome-button-sign-in
${BOTAO_ENTRAR_LOGIN}     css=#login-mail-button-sign-in
${CONTAINER_PRODUTOS}     css=#search-product-list-container
${BOTAO_SIM}              css=#age-gate-button-yes
${MENSAGEM_EMAIL}         css=#login-mail-input-email-error-message
${MENSAGEM_SENHA}         css=#login-mail-input-password-error-message
${LISTA_PRODUTO}          css=#search-product-list
${COOKIES}                css=button.optanon-allow-all
${MENSAGEM_PRODUTO}       css=#search-product-not-found
${BOTAO_CHECKOUT}         css=#bag-pre-checkout

*** Keywords ***
#### DADO
Que esteja na tela HOME do site
    Wait Until Element Is Visible   ${CABEÇALHO}

Que esteja na tela de Login
    Set Browser Implicit Wait         3s
    Wait Until Element Is Enabled     ${BOTAO_SIM}
    Click Button                      ${BOTAO_SIM}
    Click Button                      ${BOTAO_ENTRAR_HOME}
    Wait Until Element Is Visible     ${EMAIL}

Que esteja na tela de produtos
    Clicar no botão entrar
    Set Browser Implicit Wait        3s
    Wait Until Element Is Visible    ${CAMPO_PESQUISAR}

Que esteja na tela de resultado da pesquisa pelo produto "${PRODUTO}"
    Que esteja na tela de produtos
    Pesquisar pela palavra "${PRODUTO}"

Que esteja na sacola
    Que esteja na tela de produtos
    Click Element                     ${BOTAO_CHECKOUT}
    Set Browser Implicit Wait         3s
    Wait Until Element Is Visible     ${SACOLA}


#### QUANDO
Clicar no botão entrar
    Set Browser Implicit Wait         3s
    Wait Until Element Is Visible     ${BOTAO_SIM}
    Click Button                      ${BOTAO_SIM}
    Click Button                      ${BOTAO_ENTRAR_HOME}
    Click Button                      ${COOKIES}
    Wait Until Element Is Visible     ${EMAIL}
    Input Text                        ${EMAIL}    challenge.teste@gmail.com
    Input Password                    ${PASSWORD}    Teste@123**
    Click Button                      ${BOTAO_ENTRAR_LOGIN}

Inserir um e-mail inválido
    Input Text                        ${EMAIL}    challenge.teste@gmail.c
    Input Password                    ${PASSWORD}    Teste@123**
    Click Button                      ${BOTAO_ENTRAR_LOGIN}

Não inserir uma senha
    Input Text                        ${EMAIL}    challenge.teste@gmail.com
    Wait Until Element Is Enabled     ${PASSWORD}
    Click Element                     ${PASSWORD}
    Click Button                      ${BOTAO_ENTRAR_LOGIN}

Pesquisar pela palavra "${PRODUTO}"
    Set Browser Implicit Wait         3s
    Click Element                     ${CAMPO_PESQUISAR}
    Input Text                        ${CAMPO_PESQUISAR}    ${PRODUTO}
    Set Browser Implicit Wait         3s
    Wait Until Element Is Enabled     ${CONTAINER_PRODUTOS}
    Set Browser Implicit Wait         3s
    Wait Until Element Is Visible     ${LISTA_PRODUTO}
    Click Element                     css=#search-product-list-item-brand-1

Clicar no link do produto
    Wait Until Element Is Visible     css=.css-94zwmk-productsSingleListContainer > a:nth-child(5)
    Wait Until Element Is Enabled     css=.css-94zwmk-productsSingleListContainer > a:nth-child(5)
    Click Link                        css=.css-94zwmk-productsSingleListContainer > a:nth-child(5)

Pesquisar por um "${PRODUTO_INEXISTENTE}"
    Set Browser Implicit Wait         3s
    Click Element                     ${CAMPO_PESQUISAR}
    Input Text                        ${CAMPO_PESQUISAR}    ${PRODUTO_INEXISTENTE}

Acrescentar 1 unidade
    Wait Until Element Is Visible     ${SACOLA}
    Wait Until Element Is Visible     css=#product-plus-button
    Click Element                     css=#product-plus-button

Clicar na lixeira
    Wait Until Element Is Visible    css=div.css-1p8r4y7:nth-child(4) > div:nth-child(1) > svg:nth-child(3)
    Click Element                    css=div.css-1p8r4y7:nth-child(4) > div:nth-child(1) > svg:nth-child(3)

#### ENTÃO
O login deve ser realizado com sucesso
    Set Browser Implicit Wait        3s
    Wait Until Element Is Visible    ${CAMPO_PESQUISAR}

A mensagem "Eita, esse e-mail não parece correto" deve ser exibida
    Wait Until Element Is Visible    ${MENSAGEM_EMAIL}

A mensagem "O campo senha não pode ficar vazio" deve ser exibida
    Wait Until Element Is Visible    ${MENSAGEM_SENHA}

O item "${DESCRICAO}" deve ser listado no resultado da pesquisa
    Wait Until Page Contains    ${DESCRICAO}

O produto deve ser adicionado na sacola
    Wait Until Element Is Visible     ${BOTAO_ADICIONAR}
    Click Button                      ${BOTAO_ADICIONAR}
    Set Browser Implicit Wait         3s
    Wait Until Element Is Visible     ${SACOLA}

A mensagem "Putz, não conseguimos encontrar o produto "produto não existente"" deve ser mostrada
    Set Browser Implicit Wait         3s
    Wait Until Element Is Enabled     ${CONTAINER_PRODUTOS}
    Wait Until Element Is Visible     ${MENSAGEM_PRODUTO}

A mensagem "Você deseja remover este produto?" deve ser exibida
    Wait Until Element Is Visible    css=#primary-modal-button

A quantidade deve ser alterada
    Wait Until Element Is Visible    css=#product-amount
    Page Should Contain              2

#### E
O item "Budweiser 550ml | Vasilhame incluso" deve ser excluído
    Click Button    css=#primary-modal-button
    Set Browser Implicit Wait    10s

#### Setup
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}
    Delete All Cookies
    Maximize Browser Window

#### TEARDOWN
Fechar Navegador
    Delete All Cookies
    Close Browser
