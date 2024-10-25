*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py

*** Variables ***


*** Keywords ***

Open my browser
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}
    Maximize Browser Window

Open forgetPassword page
    Click Link    ${forget_password_link}

Enter email
    [Arguments]     ${email}
    Input Text    ${forget_email}    ${email}
    
Click on recover
    Click Element    ${forget_recover_btn}    

Verify email has been sent
    Page Should Contain    Email with instructions has been sent to you.
    
Close my browser
    Close All Browsers

