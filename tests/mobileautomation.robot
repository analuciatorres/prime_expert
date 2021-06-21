*** Settings ***

Documentation            Aqui estarão todos os testes de mobile do curso


Test Setup               Abrir App                 

Test Teardown            Fechar o aplicativo


Resource                 ../resources/keywords/kws_mobileautomation.robot


*** Test Cases ***
Caso de Teste 01: Abrindo o youtube e pesquisar
    [Tags]        PESQUISAR
    Abrir App
    Pesquisa um vídeo do "robot framework"
    Verificar pesquisa

Caso de Teste 02: Logar no YouTube
    [Tags]        LOGIN
    Abrir App
    Logar no aplicativo com a conta "x"
    Verificar se a conta "x" foi logada

Caso de Teste 03: Usar método Swipe na tela
    [Tags]        SW
    Abrir App
    Entrar no menu Explorar
    Usar swipe de tela até o 10 item da tela 