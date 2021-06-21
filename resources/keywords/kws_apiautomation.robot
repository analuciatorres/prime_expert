*** Settings ***
Documentation           Aqui estarão presentes todas as keywords que
...                     compõem os testes de automação de API's.

Library                 RequestsLibrary
Library                 Collections

*** Variables ******
${BASE_URL}             https://fakerestapi.azurewebsites.net/api/v1

&{JSON_POST}
...     id=201
...     title=Meu novo Book
...     description=Estamos testando a adição de novos livros
...     pageCount=556
...     excerpt=Esse livro é muito top
...     publishDate=2021-06-18T23:12:00.5639338+00:00

*** Keywords ***
Conectar a minha API
    Create Session      fakeAPI     ${BASE_URL}     disable_warnings=${True}
    ${HEADERS}          Create Dictionary       content-type=application/json
    Set Suite Variable  ${HEADERS}

Requisitar todos os livros
    ${RESPOSTA}         Get On Session    fakeAPI    Books    expected_status=any
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir o status code      
    [Arguments]         ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings       ${RESPOSTA.status_code}

Conferir o reason
    [Arguments]         ${REASON_DESEJADO}
    Should Be Equal As Strings       ${RESPOSTA.reason}     ${REASON_DESEJADO}  

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}      ${QTDE_LIVROS}

Requisitar o livro "${ID_LIVRO}"
    Create Session      fakeAPI     ${BASE_URL}     disable_warnings=${True}
    ${HEADERS}          Create Dictionary       content-type=application/json
    Set Suite Variable  ${HEADERS}
    ${RESPOSTA}         Get On Session    fakeAPI    Books/${ID_LIVRO}    expected_status=any
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}


Conferir se retorna todos os dados corretos do livro "${ID_LIVRO}"
    Dictionary Should Contain Item      ${RESPOSTA.json()}      id          20
    Dictionary Should Contain Item      ${RESPOSTA.json()}      title       Book 20
    Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount   2000
    Should Not Be Empty     ${RESPOSTA.json()["description"]}
    Should Not Be Empty     ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty     ${RESPOSTA.json()["publishDate"]}
     ${STATUSCODE_DESEJADO}

     


Cadastrar um novo livro
    Set Suite Variable          ${JSON_BODY}        ${JSON_POST}
    ${RESPOSTA}         Post On Session     fakeAPI     Books
    ...                 json=${JSON_BODY}
    ...                 headers=${HEADERS}      expected_status=any
    Log To Console      ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

     publishDate     ${JSON_POST.publishDate}