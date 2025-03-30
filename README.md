## Robot Framework

Conteúdo

- [Introdução](#introdução)
- [Instalação do Robot Framework](#instalação-do-robot-framework)
- [Escrevendo Casos de Teste](#escrevendo-casos-de-teste)

## Introdução

O Robot Framework é uma ferramenta de testes automatizados utilizada para testar sites, web apps, aplicativos desktop, mobile, bancos de dados e muitos outros tipos de sistemas. Ele permite a automação de praticamente qualquer tecnologia e é baseado no conceito de keyword-driven, que abstrai a camada de programação de baixo nível.

Possui uma sintaxe baseada em dados tabulares, sendo fácil de usar. Além disso, permite que os usuários criem e utilizem bibliotecas em Python, caso necessário. No entanto, o próprio Robot Framework já oferece diversas keywords prontas para facilitar a automação.

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

4️⃣ Instalação do VS Code e Plugins

📌 Baixe o VS Code pelo link:  [Vscode.downloads](https://code.visualstudio.com/)

Instale a versão do VS Code compatível com seu sistema operacional.

Instale o plugin: Robot Framework Language Server, que melhora a experiência ao escrever e editar arquivos de teste do Robot Framework.

**Observação:** Caso seja necessário interagir com navegadores, instale o WebDriver correspondente ao navegador utilizado.


## Escrevendo Casos de Teste

1️⃣ Criando um Projeto

No VS Code, crie uma nova pasta para armazenar os testes.

Dentro da pasta, crie um arquivo com a extensão .robot para armazenar os casos de teste.

Normalmente, é utilizado um arquivo separado para os recursos (.resource) e outro para os testes (.robot).

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
    Verificar se retorna o termo "Categorias"
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
    E o sistema exibe a seção "Categorias" 

```
Ambos os métodos têm formatos diferentes, mas seguem a mesma lógica de escrita.

3️⃣ Estruturando os Arquivos de Teste

No arquivo de teste .robot, a estrutura é a seguinte:

```sh
*** Settings ***
Documentation    Este é um exemplo de caso de teste no Robot Framework

*** Test Cases ***
Casos de teste 01: Verificação da busca do site exemple.com
    [Documentation]    Esse teste tem como objetivo realizar a validação da busca do site da exemple.com
    [Tags]             busca
    Acessar a homepage do site exemple.com
    Clicar no botão de "Aceitar" cookies
    Clicar no botão de "Faça sua busca"
    Digitar o nome "Telefone" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Telefone"
    Verificar se retorna o termo "Categorias"
```

4️⃣ Tags e Documentação

No Robot Framework, podemos adicionar informações adicionais aos testes:

Documentation: Para descrever o caso de teste ou a suíte.

Tags: Para categorizar os testes e permitir execução seletiva.



