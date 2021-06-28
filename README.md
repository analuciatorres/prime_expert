# Prime Expert
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/analuciatorres/prime_expert/blob/master/LICENSE) 

# Sobre o projeto

Conteudo do curso Prime Expert oferecido pela empresa Prime Control, referente a automação de testes usando o Robot Framework, para automação web, api e também mobile


## Funcionalidade
Contem exercícios das principais funções do Robot Framework, além de casos de testes para Web, API e Mobile.
Na automação Web com caso de teste para busca de produtos, listar produtos, e adicionar cliente fazendo login; 
Na automação de API, buscar todos os livros, buscar um livro específico e cadastrar um novo livro;
Na automação Mobile abrir e pesquisar um vídeo no Youtube, logar no youtube e usar a função swipe.

# Tecnologias utilizadas
Este teste foi feito para rodar em uma máquina com Python (com versão superior a 3.0) e Robot Framework com as bibliotecas

#Automação Web
- SeleniumLibrary
- String
- FakerLibrary

#Automação API
- RequestsLibrary
- Collections

#Automação Mobile
- AppiumLibrary

```phython
# clonar repositório
https://github.com/analuciatorres/prime_expert

# executar o projeto Web e instalar as bibliotecas 
python -m pip install SeleniumLibrary
python -m pip install FakerLibrary

#execultar o comando 
python -m robot -d ./results/webautomation  tests/webautomation.robot

# executar o projeto API e instalar as bibliotecas 
python -m pip install RequestsLibrary
python -m pip install Collections

#execultar o comando 
python -m robot -d ./results/apiautomation  tests/apiautomation.robot

# executar o projeto Mobile e instalar as bibliotecas 
python -m pip install AppiumLibrary

#execultar o comando 
python -m robot -d ./results/mobileautomation  tests/mobileautomation.robot



```

# Autor

Ana Lucia Torres da Silva

https://github.com/analuciatorres

https://www.linkedin.com/in/analuciatorresdasilva/
