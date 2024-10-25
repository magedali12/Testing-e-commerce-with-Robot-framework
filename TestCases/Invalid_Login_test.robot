*** Settings ***
Library  SeleniumLibrary
Library     DataDriver   ../TestData/LoginData.csv
Resource    ../Resources/Login_resources.robot
Suite Setup  Open my browser    ${url}    ${browser}
Suite Teardown  Close my browser
Test Template   Invalid Login


*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome


*** Test Cases ***
Login with csv  using ${email} and  ${password} and  ${error_msg}

*** Keywords ***
Invalid Login
    [Arguments]     ${email}    ${password}     ${error_msg}
    Enter email    ${email}
    Enter password    ${password}
    Click login btn

    ${actual_error_msg}=   Get invalid login msg
    Log To Console    ${actual_error_msg}
    Should Be Equal    ${actual_error_msg}    ${error_msg}









