
*** Settings ***
Documentation           Neste arquivo estarão presentes nossos primeiros fluxos
...                     de automação web e seus respectivos cenários automatizados.

Resource                ../resources/keywords/kws_webautomation.robot

Test Setup              Abrir o navegador   
Test Teardown           Fechar o navegador


*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]        BLOUSE
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]        NAO_EXISTE
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""


Caso de Teste 03: Listar Produtos
    [Tags]        LISTAR
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de teste 04: Adicionar Cliente
    [Tags]        CLIENTE
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account" para cadastrar
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro