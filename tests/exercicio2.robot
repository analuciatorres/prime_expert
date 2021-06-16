*** Variables ***

# Variável Simples
${NOME}             Ana Torres


# Varíaveis tipo Dicionários
&{PESSOA}            
...                nome=Ana   
...                sobrenome=Torres    
...                idade=37



*** Test Cases ***
Cenario: email nome_sobrenome_idade@robot.com
    [Tags]    EMAIL
    ${RESULTADO}    Email "${PESSOA.nome}" "${PESSOA.sobrenome}" "${PESSOA.idade}" "@robot.com"



*** Keywords ***

Email "${PESSOA.nome}" "${PESSOA.sobrenome}" "${PESSOA.idade}" "@robot.com"
    
    ${EMAIL}                  Catenate    SEPARATOR=_    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}
    ${EMAIL}                  Evaluate    "${EMAIL}"+"@robot.com"
    [Return]                 ${EMAIL}
    Log To Console           ${EMAIL} 