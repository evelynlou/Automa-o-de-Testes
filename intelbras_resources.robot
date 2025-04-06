*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    String

*** Variables ***

${URL}    https://www.intelbras.com/pt-br/
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

Digitar o nome "${TERMO}" no campo de pesquisa
    Input Text    locator=${INPUT}    text=${TERMO}

Verificar o resultado da pesquisa se esta listando o termo "${Termo}"
    Wait Until Page Contains Element    locator=(//div[contains(text(),'${Termo}')])[1]
    Capture Element Screenshot    locator=${RESULTADOS}

Verificar se retorna o termo "Categorias"
    Element Should Be Visible    locator=${RESULTADOS}
    ${CATEGORIAS_TEXTO}    Get Text    ${RESULTADOS}
    Should Contain    container=${CATEGORIAS_TEXTO}    item=em Categorias
    Capture Element Screenshot    locator=${RESULTADOS}
    
Verificar o resultado da pesquisa "Vip"
    Sleep    30s
    Wait Until Element Is Visible    locator=${RESULTADOS}
    ${RESULTADOS_TEXTO}    Get Text    ${RESULTADOS}
    Should Contain    container=${RESULTADOS_TEXTO}    item=VIP

Verificar se o termo "Produtos" é retornado
    Element Should Be Visible    locator=${RESULTADOS}
    ${PRODUTOS_TEXTO}    Get Text    ${RESULTADOS}
    Should Contain    container=${PRODUTOS_TEXTO}    item=em Produtos
    Capture Element Screenshot    locator=${RESULTADOS}
