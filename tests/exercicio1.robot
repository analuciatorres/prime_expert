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

Cenario: email nome_sobrenome_idade@robot.com
    [Tags]    EMAIL
    ${RESULTADO}    Email "${PESSOA.nome}" "${PESSOA.sobrenome}" "${PESSOA.idade}" "@robot.com"



Cenario: Contar de 0 a 9
    FOR    ${count}            IN RANGE    0    10
        Log To Console        ${count}
    END

        
Cenario: Contador
    [Tags]        Contador
    FOR    ${count}            IN RANGE    0    10
        Log To Console      Estou no número ${count}
    END
Cenario: Países
    [Tags]        PAISES
    @{PAÍSES}        Create List    Brasil    Alemanha    Jamaica    Canadá    México
    FOR    ${países}    IN    @{PAÍSES}
        Log To Console    Estou no seguinte país ${países}
    END
    

Cenario: Imprimir 5 e 8
    [Tags]        Contador_2
    FOR    ${numero}            IN RANGE    0    10
        IF            '${numero}'=='5'
            Log To Console      Estou no número ${numero}
        ELSE IF        '${numero}'=='8'
            Log To Console      Estou no número ${numero}
        END
    END



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

Email "${PESSOA.nome}" "${PESSOA.sobrenome}" "${PESSOA.idade}" "@robot.com"
    
    ${EMAIL}                  Catenate    SEPARATOR=_    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}@robot.com
    [Return]                 ${EMAIL}
    Log To Console           ${EMAIL} 

Contar de 0 a 9
    FOR    ${count}            IN RANGE    0    10
        Log To Console        ${count}
    END

Contardor 
    FOR    ${count}            IN RANGE    0    10
        Log To Console      Estou no número ${count}
    END

Imprimir a lista de países
    @{PAÍSES}        Criate list    Brasil    Alemanha    Jamaica    Canadá    México
    FOR    ${países}    IN    @{PAÍSES}
        Log To Console    Estou no seguinte país ${países}
    END

Imprimir 5 e 8
    FOR    ${numero}            IN RANGE    0    10
        IF '${count}'=='5'
        Log To Console      Estou no número ${count}
        IF ELSE '${numero}'=='8'
        Log To Console      Estou no número ${count}
    END