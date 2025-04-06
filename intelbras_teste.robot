*** Settings ***
Documentation    Esse suíte tem como finalidade testar a busca do site da  intelbras.com
Resource         intelbras_Resources.robot  
Suite Setup      Abrir o Navegador
Test Teardown    Limpar o Campo de pesquisa

*** Test Cases ***

Casos de teste 01: Verificação da busca genérica do site da intelbras.com
    [Documentation]    Esse teste tem como objetivo realizar a validação da busca genérica do site da intelbras.com
    [Tags]             busca_generica
    Acessar a homepage do site da intelbras.com
    Clicar no botão de "Aceitar" cookies
    Clicar no botão de "Faça sua busca"
    Digitar o nome "Telefone" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Telefone"
    Verificar se retorna o termo "Categorias"

Caso de teste 02: Verificação da busca não generica do site da intelbras.com
    [Documentation]    Esse teste tem como objetivo realizar a validação da busca não genérica do site da intelbras.com
    [Tags]             busca_nao_generica
    Digitar o nome "Twibi Force plug" no campo de pesquisa
    Verificar o resultado da pesquisa se esta listando o termo "Twibi Force Plug"

Caso de teste 03: Verificação da busca por Termos Indexáveis no site da intelbras.com
    [Documentation]    Esse teste tem como objetivo realizar a validação da busca com termos Indexáveis do site da intelbras.com                
    [Tags]             busca_indexavel
    Digitar o nome "Vip" no campo de pesquisa
    Verificar o resultado da pesquisa "Vip"
    Verificar se o termo "Produtos" é retornado
