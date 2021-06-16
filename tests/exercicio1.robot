***Settings***

# Dentro de documentation estarão as informações sobre 
Documentation       Aqui estarão todos os exercícios do curso Prime Expertes 
...                 focado em imersão com Robot

*** Variables ***

# Variável Simples
${NOME}             Ana Torres


# Varíaveis tipo Dicionários
&{PESSOA}            
...                nome=Ana   
...                sobrenome=Torres    
...                idade=37
...                endereço=Vicente Felipe Celestino, 145
...                cep=09910-080
...                celular=11 982304522


# Variável tipo lista
@{FRUTAS}            
...                Maçã    
...                Banana    
...                Uva
...                Morango
...                Mixirica
...                Maracujá

*** Test Cases ***
Cenario: Imprimir o Dicionario
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.idade}

Cenario: Dados pessoais
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.endereço}
    Log To Console    ${PESSOA.cep}
    Log To Console    ${PESSOA.celular}

Cenario: Cinco Frutas
    Log To Console    \n ${FRUTAS[0]}
    Log To Console    \n ${FRUTAS[1]}
    Log To Console    \n ${FRUTAS[2]}
    Log To Console    \n ${FRUTAS[3]}
    Log To Console    \n ${FRUTAS[4]}
    Log To Console    \n ${FRUTAS[4]}


Cenario: Realizar soma
    [Tags]    SOMA
    ${RESULTADO}    Somar dois números    11    23
    Log To Console    ${RESULTADO}

Cenario: Meu teste soma
    [Tags]    SOMA2
    ${RESULTADO}    Somar dois números "55" "44"
    Log To Console    ${RESULTADO}


*** Keywords ***
Somar dois números
    [Arguments]              ${NUM_A}    ${NUM_B}
    ${SOMA}                  Evaluate    ${NUM_A}+${NUM_B}
    [Return]                 ${SOMA}
    Log To Console           ${SOMA}    

Somar dois números "${NUM_A}" "${NUm_B}"
    ${SOMA}                  Evaluate    ${NUM_A}+${NUM_B}
    [Return]                 ${SOMA}
    Log To Console           ${SOMA}  

