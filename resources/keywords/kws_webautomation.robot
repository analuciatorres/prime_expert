
*** Settings ***
Documentation           Aqui estarão presentes todas as keywords que
...                     compõem os testes de automação web.

Library                 SeleniumLibrary
Library                 String
Library                 FakerLibrary    locale=pt_BR

*** Variable ***
${BROWSER}          chrome
${URL}              http://automationpractice.com
${CIDADE}           New York

*** Keywords ***
Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a página home do site Automation Practice
    Go To               ${URL}
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul
    Title Should Be                     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          name=search_query       ${PRODUTO}
    Capture Page Screenshot

Clicar no botão pesquisar
    Click Element       name=submit_search
    Capture Page Screenshot

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(), "${PRODUTO}")]


 Conferir mensagem "No results were found for your search "itemNãoExistente""
    Wait Until Element Is Visible       css=p[class="alert alert-warning"]
    Wait Until Element Is Visible       css=#center_column span[class="heading-counter"
    

Passar o mouse por cima da categoria ${WOMEN} no menu principal superior de categorias
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul/li[1]/a
    Mouse Over                          xpath=//*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria ${SUMMER_DRESSES} 
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                       xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a


Conferir se os produtos da sub-categoria ${SUMMER_DRESSES} foram mostrados na página
    Wait Until Element Is Visible       css=span[class="cat-name"]
    Wait Until Element Is Visible       css=span[class="heading-counter"]
    Title Should Be                     Summer Dresses - My Store

Clicar em ${SIGN_IN}
    Click Element                       css=a[title="Log in to your customer account"]


Informar um e-mail válido
    ${EMAILFAKE}                FakerLibrary.Email
    Title Should Be                     Login - My Store
    Input Text        id=email_create   ${EMAILFAKE} 



Clicar em "Create an account" para cadastrar
    Wait Until Element Is Visible       css=i[class="icon-user left"]
    Click Element                       css=i[class="icon-user left"] 

Preencher os campos obrigatórios
    ${NOMEFAKE}                         FakerLibrary.Name
    ${PASSWORDFAKE}                     FakerLibrary.Password
    ${ENDERECOFAKE}                     FakerLibrary.Address
    ${CODIGOPOSTALFAKE}                 FakerLibrary.Postcode
    ${TELEFONEFAKE}                     FakerLibrary.Phone Number     
    Wait Until Element Is Visible       id=customer_firstname           
    Input Text                          id=customer_firstname                  ${NOMEFAKE}
    Input Text                          id=customer_lastname                   ${NOMEFAKE}
    Input Text                          id=passwd                              ${PASSWORDFAKE} 
    Input Text                          id=address1                            ${ENDERECOFAKE}
    Input Text                          id=city                                ${CIDADE}
    Select From List By Index           id=id_state   33                       
    Input Text                          id=postcode                            ${CODIGOPOSTALFAKE}
    Input Text                          id=phone_mobile                        ${TELEFONEFAKE} 

Clicar em "Register" para finalizar o cadastro
    Title Should Be                     Login - My Store
    Wait Until Element Is Visible       id=submitAccount
    Click Element                       id=submitAccount
    Wait Until Element Is Visible       css=h1[class="page-heading"]
    
    
    
                   

    


    