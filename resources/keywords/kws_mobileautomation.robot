*** Settings ***
Documentation           Aqui estarão presentes todas as keywords que
...                     compõem os testes de automação mobile.

Library                  AppiumLibrary
Library                  FakerLibrary    locale=pt_BR

*** Variables ***
${CONTA}                 testes.automacao123
${SENHA_CONTA}           ZXC951!@#


*** Keywords ***
Abrir App
    Open Application                   http://localhost:4723/wd/hub
    ...                                automationName=UiAutomator2
    ...                                platformName=Android
    ...                                deviceName=J5AXB603594995H
    ...                                autoGrantPermissions=true
    ...                                appPackage=com.google.android.youtube
    ...                                appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
    Capture Page Screenshot
    Close Application
    
Pesquisa um vídeo do ${PESQUISAR}
    Wait Until Element Is Visible         xpath=//android.widget.ImageView[@content-desc="Pesquisar"]
    Click Element                         xpath=//android.widget.ImageView[@content-desc="Pesquisar"]
    Input Text                            id=com.google.android.youtube:id/search_edit_text      ${PESQUISAR}
    Wait Until Element Is Visible         xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[1]/android.widget.TextView        
    Click Element                         xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[1]/android.widget.TextView
    Press Keycode                         66
    Capture Page Screenshot
    

Verificar pesquisa
    Wait Until Element Is Visible         class=android.widget.ImageView
    Capture Page Screenshot

Logar no aplicativo com a conta ${CONTA}
    Wait Until Element Is Visible         accessibility_id=Conta
    Click Element                         accessibility_id=Conta
    Wait Until Page Contains Element      class=android.widget.TextView            15
    Click Element                         class=android.widget.TextView   
    Wait Until Page Contains Element      id=identifierId                          15
    Click Element                         id=identifierId 
    Input Text                            id=identifierId                          ${CONTA}
    Sleep    
    Press Keycode                         66
    Wait Until Page Contains Element      class=android.widget.Button 
    Click Button                          class=android.widget.Button       
    Wait Until Page Contains Element      class=android.widget.EditText            15
    Click Button                          class=android.widget.EditText      
    Input Password                        class=android.widget.EditTextlocator     ${SENHA_CONTA}   
    Press Keycode                         66
    Wait Until Page Contains Element      class=android.widget.Button              15 
    Click Button                          class=android.widget.Button   
    Wait Until Page Contains Element      class=android.widget.Button              15    
    Click Button                          class=android.widget.Button 
    Capture Page Screenshot

Verificar se a conta ${CONTA} foi logada
    Wait Until Element Is Visible         accessibility_id=Conta
    Click Element                         accessibility_id=Conta
    Wait Until Element Is Visible         id=com.google.android.youtube:id/email
    Capture Page Screenshot

Entrar no menu Explorar
    Wait Until Page Contains Element      xpath=//android.widget.Button[@content-desc="Explorar"]/android.widget.TextView        15
    Click Element                         xpath=//android.widget.Button[@content-desc="Explorar"]/android.widget.TextView
    Capture Page Screenshot  
    

Usar swipe de tela até o 10 item da tela
    Wait Until Page Contains Element      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup[2]/android.view.ViewGroup        15
    FOR   ${POSICAO}  IN RANGE   0   10
        Swipe   350   1000   350    200
        ${POSICAO}=   Set Variable    ${POSICAO}+1  
    END   
    Capture Page Screenshot