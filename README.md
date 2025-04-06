## Robot Framework

Conteúdo

- [Introdução](#introdução)
- [Keywords](#keywords)
- [Instalação do Robot Framework](#instalação-do-robot-framework)
- [Escrevendo Casos de Teste](#escrevendo-casos-de-teste)
- [Comandos no Terminal](#comandos-no-terminal)

## Introdução

O Robot Framework é uma ferramenta de automação de testes utilizada para validar o funcionamento de sites, aplicações web, aplicativos desktop, mobile, bancos de dados, entre outros tipos de sistemas.

Ele suporta a automação de praticamente qualquer tecnologia e é baseado no conceito de keyword-driven (dirigido por palavras-chave), o que abstrai a complexidade da programação de baixo nível, tornando o processo mais acessível.

Possui uma sintaxe baseada em dados tabulares, sendo fácil de usar. Além disso, permite que os usuários criem e utilizem bibliotecas em Python, caso necessário. No entanto, o próprio Robot Framework já oferece diversas keywords prontas para facilitar a automação.

## Keywords

As keywords (palavras-chave) são comandos que realizam ações nos testes. Um conjunto de keywords forma uma biblioteca (library).

Cada keyword pode receber argumentos, que são informações necessárias para a execução da ação desejada.

A keyword que será utilizada varia de acordo com a biblioteca carregada. Cada biblioteca possui suas próprias keywords. Algumas keywords universais, válidas para qualquer biblioteca, estão disponíveis aqui:
[Builtln Library](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)

**Observações importantes:**

- Quando um argumento aparece com o sinal de igual (=) na documentação, significa que ele possui um valor padrão (default). Nesse caso, o valor é opcional, pois se não for informado, será utilizado o valor padrão automaticamente.

- Quando não há o sinal de igual, o argumento é obrigatório e precisa ser informado para que a keyword funcione corretamente.

## Instalação do Robot Framework

1️⃣ Instalação do Python

📌 Baixe o Python: https://www.python.org/downloads

- Instale a versão do Python compatível com seu sistema operacional.

- Após a instalação, vá até as variáveis de ambiente do sistema e verifique se os diretórios do Python estão presentes no Path, para evitar problemas futuros.

Verifique a instalação:

```sh
  python --version
```

2️⃣ Instalação do Robot Framework

📌 Acesse: https://robotframework.org/

Instale com o comando:

```sh
  pip install robotframework
```

Verifique a instalação:
```sh
  robot --version
```

3️⃣ Instalação das Libraries

- Na aba Resources do site do Robot Framework, acesse a seção Libraries e escolha a biblioteca desejada.

- Clique sobre a biblioteca escolhida para acessar sua documentação (geralmente no GitHub) e veja o comando de instalação correspondente.

4️⃣ Instalação do VS Code e Plugin

📌 Baixe o VS Code: https://code.visualstudio.com/

**Instale o plugin:**

- Robot Framework Language Server

Esse plugin facilita a escrita e edição dos arquivos .robot.


5️⃣ Extensão para Captura de Locators

📌  Instale a extensão: [SelectorsHub](https://chromewebstore.google.com/detail/selectorshub-xpath-helper/ndgimibanhlabgdgjcpbbndiehljcpfh?hl=pt-BR)

Essa ferramenta ajuda a identificar e copiar locators de elementos na tela.

**Observações importantes:**

Para testes com navegador, instale o WebDriver correspondente ao navegador utilizado.

## Escrevendo Casos de Teste

1️⃣ Criando um Projeto

- Crie uma nova pasta no VS Code para armazenar os testes.

- Dentro da pasta, crie arquivos com a extensão .robot.

É comum separar os arquivos de recursos dos arquivos de testes.

2️⃣ Métodos de Escrita dos Testes

- O Robot Framework permite escrever casos de teste usando dois principais métodos:

✅ Procedural

Formato direto, menos formal:

Exemplo:

```sh
    Acessar a homepage do site exemple.com
    Clicar no botão de "Aceitar" cookies
    Clicar no botão de "Faça sua busca"
    Digitar o nome "Telefone" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Telefone"
```

✅ Gherkin (BDD)

Baseado nas regras de negócio e usa palavras-chave como:

- Given (Dado) → Define o estado inicial

- When (Quando) → Descreve a ação realizada

- Then (Então) → Indica o resultado esperado

- And (E) → Conecta múltiplas condições

- But (Mas) → Expressa exceções

Exemplo: 

```sh
    Dado que o usuário acessa a página inicial do site "https://www.exemple.com"  
    E aceita os cookies  
    Quando clica no botão "Faça sua busca"  
    E digita "Telefone" no campo de pesquisa  
    Então o sistema exibe os resultados contendo "Telefone"  

```
Ambos os formatos seguem a mesma lógica de execução no Robot Framework.

3️⃣ Estrutura do Arquivo de Teste

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
**Informações úteis:**

- Sessões devem começar com *** e conter o nome da sessão entre asteriscos.

- Settings: configurações do seu arquivo de teste. Nessa seção, também é possível definir o Setup (ações executadas antes dos testes) e o Teardown (ações executadas após os testes).

- Documentation: descrição do teste.

- Tags: categorização para facilitar filtros.

4️⃣ Variaveis no Robot Framework

Variaveis no robot:

- Global: visível em todos os arquivos.

- Suite: visível apenas dentro da suíte.

- Teste: visível dentro do caso de teste.

- Local: visível apenas dentro da keyword.

**Informações úteis:**

- Existem keywords que permitem definir o escopo de uma variável dentro do Robot Framework. Com elas, é possível transformar uma variável em global, de suíte, de teste ou local:
```sh
Set Global Variable     ${variavel}
Set Suite Variable      ${variavel}
Set Test Variable       ${variavel}
${variavel}   Set Variable    valor
```
- As variáveis declaradas na seção *** Variables *** de um arquivo de recurso (.resource) são consideradas globais, podendo ser acessadas por qualquer teste que importe esse recurso.

- Já as variáveis declaradas diretamente na seção *** Variables *** de um arquivo de teste (.robot) têm escopo de suíte, ou seja, só são visíveis dentro daquele arquivo.

5️⃣ Estrutura do Arquivo de Recursos

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

Acessar a homepage do site da exemple.com
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

**Informações úteis:**

- Em *** Settings ***, declaramos as libraries que serão usadas na automação.

- Em *** Variables ***, definimos valores reutilizáveis.

- Em *** Keywords ***, criamos blocos de ações.


##   Comandos no Terminal

| Comando      | Descrição                                             | Exemplo                                                                 |
|--------------|-------------------------------------------------------|-------------------------------------------------------------------------|
| `robot -i`   | Executa testes com uma tag específica                 | `robot -i busca_tests`                                                  |
| `robot -e`   | Exclui uma tag específica (executa todas menos essa)  | `robot -e menu`                                                         |
| `robot -d`   | Gera relatórios em uma pasta específica               | `robot -d resultados`                                                   |
| `robot -v`   | Substitui o valor de uma variável global              | `robot -v BROWSER:chrome`                                               |
| `robot -t`   | Executa um caso de teste específico                   | `robot -t "Caso de Teste 01: Verificação da busca do site exemple.com"` |

**Dica:**

- Sempre utilize o parametro -d para definir uma pasta de destino onde serão salvos os arquivos gerados (log.html, report.html, output.xml..).
- Sempre que for executar um teste, comece o comando com "robot", seguido dos parâmetros desejados e por fim, o caminho do arquivo de teste ou da pasta.

