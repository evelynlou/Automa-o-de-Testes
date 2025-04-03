## Robot Framework

Conteúdo

- [Introdução](#introdução)
- [Keywords](#keywords)
- [Instalação do Robot Framework](#instalação-do-robot-framework)
- [Escrevendo Casos de Teste](#escrevendo-casos-de-teste)
- [Comandos no Terminal](#comandos-no-terminal)

## Introdução

O Robot Framework é uma ferramenta de testes automatizados utilizada para testar sites, web apps, aplicativos desktop, mobile, bancos de dados e muitos outros tipos de sistemas. Ele permite a automação de praticamente qualquer tecnologia e é baseado no conceito de keyword-driven, que abstrai a camada de programação de baixo nível.

Possui uma sintaxe baseada em dados tabulares, sendo fácil de usar. Além disso, permite que os usuários criem e utilizem bibliotecas em Python, caso necessário. No entanto, o próprio Robot Framework já oferece diversas keywords prontas para facilitar a automação.

## Keywords

As keywords, são palavras chaves que realizam ações no teste e os conjuntos de keywords formam uma library.

As keywords vem juntamente com argumentos que são informações, que permitem que seja realizado uma ação.

A keyword que será implementada vai variar de acordo com a library que está sendo utilizada. cada library possui suas proprias keywords. Mas há aquelas que funcionam para todas, idenpendete da library, se encontra no seguinte link: https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

Um ponto importante a ser resaltado, é que durante a analise da documentação das keywords seus argumentos vierem com o sinal de "=" para seu valor, significa que não precisa necessariamente passar um valor, que o mesmo cairá no default. Quando os argumentos visto na docuemntação vierem sem o sinal de igual, significa que precisa obrigatoriamente passar o valor para ele.

## Instalação do Robot Framework

1️⃣ Instalação do Python

📌 Baixe o Python pelo link: [python.org/downloads](https://www.python.org/downloads)

Instale a versão do Python compatível com seu sistema operacional.

Após a instalação, vá até as variáveis de ambiente do sistema e verifique se os diretórios do Python estão presentes no Path, para evitar problemas futuros.

Para conferir se a instalação foi feita corretamente, execute o seguinte comando no terminal:

```sh
  python --version
```

2️⃣ Instalação do Robot Framework

📌 [robbotframework.org/](https://robotframework.org/)

Acesse a página, clique na aba Get Started e vá até a seção Install.

Execute o seguinte comando para instalar o Robot Framework:

```sh
  pip install robotframework
```

Para verificar a instalação, execute:
```sh
  robot --version
```

3️⃣ Instalação das Libraries

Na página do Robot Framework, na aba Resources, há uma seção chamada Libraries, onde estão todas as bibliotecas disponíveis para uso.

Ao escolher a biblioteca desejada, clique no nome da biblioteca, que irá redirecionar para a documentação oficial no GitHub, onde estará o comando para instalação.

4️⃣ Instalação do VS Code e Plugin

📌 Baixe o VS Code pelo link:  [Vscode.downloads](https://code.visualstudio.com/)

Instale a versão do VS Code compatível com seu sistema operacional.

Instale o plugin: Robot Framework Language Server, que melhora a experiência ao escrever e editar arquivos de teste do Robot Framework.

5️⃣ Instalação da Extensão para pegar o locator de componentes:

📌 Baixe a extensão pelo link:  [Extensão.downloads](https://chromewebstore.google.com/detail/selectorshub-xpath-helper/ndgimibanhlabgdgjcpbbndiehljcpfh?hl=pt-BR))


**Observação:** Caso seja necessário interagir com navegadores, instale o WebDriver correspondente ao navegador utilizado.

## Escrevendo Casos de Teste

1️⃣ Criando um Projeto

No VS Code, crie uma nova pasta para armazenar os testes.

Dentro da pasta, crie um arquivo com a extensão ".robot" para armazenar os casos de teste.

Normalmente, é utilizado um arquivo separado para os recursos e outro para os testes.

2️⃣ Escolhendo o Método de Escrita dos Testes

O Robot Framework permite escrever casos de teste usando dois principais métodos:

Procedural

Segue um formato menos formal para descrever cenários de testes.

Exemplo:

```sh
    Acessar a homepage do site exemple.com
    Clicar no botão de "Aceitar" cookies
    Clicar no botão de "Faça sua busca"
    Digitar o nome "Telefone" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Telefone"
```

Gherkin BDD

Baseado nas regras de negócio e usa palavras-chave como:

1️⃣ Given (Dado) → Define o estado inicial

2️⃣ When (Quando) → Descreve a ação realizada

3️⃣ Then (Então) → Indica o resultado esperado

4️⃣ And (E) → Conecta múltiplas condições

5️⃣ But (Mas) → Expressa exceções

Exemplo: 

```sh
    Dado que o usuário acessa a página inicial do site "https://www.exemple.com"  
    E aceita os cookies  
    Quando clica no botão "Faça sua busca"  
    E digita "Telefone" no campo de pesquisa  
    Então o sistema exibe os resultados contendo "Telefone"  

```
Ambos os métodos têm formatos diferentes, mas seguem a mesma lógica para a execução dos testes.

3️⃣ Estruturando o Arquivo de Teste

No arquivo de teste .robot, a estrutura é a seguinte:

```sh
*** Settings ***
Documentation    Este é um exemplo de caso de teste no Robot Framework
Resource         Teste_Resources.robot  
Suite Setup      Abrir o Navegador
Test Teardown    Limpar o Campo de pesquisa

*** Test Cases ***
Casos de teste 01: Verificação da busca do site exemple.com
    [Documentation]    Esse teste tem como objetivo realizar a validação da busca do site da exemple.com
    [Tags]             busca
    Acessar a homepage do site exemple.com
    Clicar no botão de "Aceitar" cookies
    Clicar no botão de "Faça sua busca"
    Digitar o nome "Telefone" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Telefone"
```
No robot ao iniciar uma sessão, sempre terá que ser utilizado o "***", no inicio e no final do titulo da sessão.

Na estrutura acima, podemos observar a sessão chamada "Settings", tal sessão é utilizada para a configuração do arquivo de testes, onde será chamado arquivo de recursos do nosso teste e também pode ser utilizada para a implementação do Setup(Ação antes do suíte ou  dos casos de teste) e Teardow(Ação depois do suíte ou dos casos de teste).

No Robot Framework, podemos adicionar informações adicionais aos testes:

Documentation: Para descrever o caso de teste ou o suíte.

Tags: Para categorizar os testes e permitir execução seletiva.

4️⃣ Variaveis

Antes de ir para estrutura do arquivo de recurso, é importante mencionar sobre as variaveis dentro do robot.

Variaveis no robot:

- Variavel Global: Variavel que funciona para todos os arquivos de testes, presente no diretório
- Variavel Suíte: Variavel que pode ser utilizada apenas no arquivo de teste que está sendo chamada, não funcionando para demais arquivos.
- Variavel Local: variavel que funciona somente na keyword, em que está sendo chamada
- Variavel de Caso de Teste: variavel poderá ser utilizada apenas no "Caso de teste", onde está sendo chamada.

Essas variaeis possuem keywords que podem ser chamadas e que tornaram as variaveis, como global, suíte, local e de casos de testes:

- Set global variable: Essa keyword transformar uma variável em global.
    
    Ex: Set global variable      ${Variavel}
    
- Set suíte Variable: Essa keyword transformar a variável em suíte, ficando visível pra todo um suíte.
    
    Ex: Set suíte Variable:        ${Variavel}
    
- Set test Variable: Essa keyword deixa a variável visível somente pra esse teste.
    
    Ex: Set test Variable:          ${Variavel}
    
- Set Variable: Deixa a variável visível localmente.
    Ex: ${Variavel} Set Variable     Valor

5️⃣ Estruturando o Arquivo de Recurso de Teste

No arquivo de Recurso de teste, a estrutura é a seguinte:

```sh
*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    String

*** Variables ***

${URL}    https://www.exemple.com
${VALOR}    //a[@class='about__anchor anchor-filled']
${VALOR_BUSCA}    (//span[@class='text text--400 weight--small-200 search-input-label show-for-medium'])[1]
${INPUT}    //input[@name='search']
${RESULTADOS}    (//div[@class='pt3 pb3 pr4'])[1]

*** Keywords ***

Abrir o Navegador
    Open Browser    browser=Chrome

Limpar o Campo de pesquisa
    Element Should Be Visible    locator=${INPUT}
    Clear Element Text           locator=${INPUT}
    Sleep    1s

Acessar a homepage do site da intelbras.com
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${VALOR}
 
Clicar no botão de "Aceitar" cookies
    Wait Until Element Is Visible     locator=//div[@id='privacytools-banner-consent']
    Click Element                locator=//a[@id='dm876A']

Clicar no botão de "Faça sua busca"
    Sleep    1s
    Element Should Be Visible        locator=${VALOR_BUSCA}
    Click Element                    locator=${VALOR_BUSCA}

Digitar o nome "Telefone" no campo de pesquisa
    Input Text    locator=${INPUT}    text=Telefone

Verificar o resultado da pesquisa se esta listando o termo "Telefone"
    Wait Until Page Contains Element    locator=(//div[contains(text(),'Telefone')])[1]
    Capture Element Screenshot    locator=${RESULTADOS}

```

No arquivo de recursos também teremos a sessão "Settings", nela colocaremos a library que será utilziada na automação.

No exemplo acima podemos observar que os **Passos** e **Verificações** de testes que foram implementadas no arquvivo de testes, estão sendo chamados na sessão Keywords, Cada passo e verificação vem colado na lateral, para identificação que se trata do titulo da nossas keywords. E as keywords vem abaixo com espaços duplos da lateral e espaços du0plos dos seus argumentos.

##   Comandos no Terminal
Abaixo seguem alguns exemplo de comandos que podem ser utilizados no terminal.

- robot -i: Esse comando executa uma tag especifica

Ex: robot -i menu amazon.com.br

- robot -e: Ele exclui uma tag, ou seja, roda tudo menos aquela tag.

Ex: robot -e menu amazon.com.br.

- robot -d: ele executa o teste e joga os arquivos que são gerados, dentro desse arquivo especifico

Ex: robot -d nome do arquivo e nome do arquivo de teste
Obs: Sempre chamar o nome do arquivo, para ele joga o lixo que foi criado dentro dessa pasta.

- robot -v: ele retira uma variavel global que foi colocada e adiciona a nova que foi declarada no terminal.

- robot - t: Executa um titulo de caso de teste especifico.
    
  Ex: robot -t  “o titulo da keyword” amazon.com.br


