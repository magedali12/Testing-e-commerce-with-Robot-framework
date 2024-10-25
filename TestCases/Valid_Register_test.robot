*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Register_resources.robot
Suite Setup  Open my browser    ${url}    ${browser}
Suite Teardown  Close my browser

*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome
${gender}       M
${firstname}    maged
${lastname}     ali
${email}        migzz15@test.com
${password}     123456
${confirmPassword}      123456

*** Test Cases ***
Valid Register
    Open register page from register button
    Select gender    ${gender}
    Enter firstname    ${firstname}
    Enter lastname    ${lastname}
    Enter email    ${email}
    Enter password    ${password}
    Enter confirmpassword    ${confirmPassword}
    Click register btn
    Verify valid register
    Click on continue
    Verify go to home page





