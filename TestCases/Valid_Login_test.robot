*** Settings ***
Resource    ../Resources/Login_resources.robot
Suite Setup  Open my browser    ${url}    ${browser}
Suite Teardown  Close my browser


*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome
${email}     migzz1@test.com
${password}     123456

*** Test Cases ***
Valid login
    Enter email    ${email}
    Enter password    ${password}
    Click login btn
    Verify successful login


