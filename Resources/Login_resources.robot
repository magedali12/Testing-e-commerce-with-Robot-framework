*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py

*** Variables ***


*** Keywords ***

Open my browser
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}
    Maximize Browser Window

Enter email
    [Arguments]     ${email}
    Input Text    ${login_email}    ${email}

Enter password
    [Arguments]     ${password}
    Input Text    ${login_password}    ${password}

Click login btn
    Click Element    ${login_btn}

Get invalid login msg
    ${error}=   Get Text    ${error_invalid_login}
    [Return]     ${error}


Verify successful login
    Page Should Contain    Welcome to our store

Verify unsccessful login
    Page Should Not Contain    Welcome to our store

Close my browser
    Close All Browsers
