*** Settings ***
Resource    ../Resources/Forget_Password.robot
Suite Setup  Open my browser    ${url}    ${browser}
Suite Teardown  Close my browser


*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome
${email}     migzz1@test.com

*** Test Cases ***
Forget Test
    Open forgetPassword page
    Enter email    ${email}
    Click on recover
    Verify email has been sent

