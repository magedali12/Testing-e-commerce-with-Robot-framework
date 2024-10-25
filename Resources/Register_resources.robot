*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py



*** Keywords ***

Open my browser
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}
    Maximize Browser Window

Open register page from header
    Click Link    ${reg_link}

Open register page from register button
    Click Element    ${reg_btn_from_loginPage}

Select gender
    [Arguments]     ${gender}
    Select Radio Button    ${reg_gender}    ${gender}

Enter firstname
    [Arguments]     ${firstname}
    Input Text    ${reg_firstname}    ${firstname}


Enter lastname
    [Arguments]     ${lastname}
    Input Text    ${reg_lastname}    ${lastname}


Enter email
    [Arguments]     ${email}
    Input Text    ${reg_email}    ${email}


Enter password
    [Arguments]     ${password}
    Input Text    ${reg_password}    ${password}

Enter confirmpassword
    [Arguments]     ${confirmpassword}
    Input Text    ${reg_confirmPassword}    ${confirmpassword}

Click register btn
    Click Element    ${reg_btn}

      
Verify valid register
    Page Should Contain    Your registration completed    
    
Verify invalid register    
    Page Should Not Contain    Your registration completed
     
    
Click on continue
    Click Element    ${reg_Continue}    
    
Verify go to home page
    Page Should Contain    Welcome to our store

Get firstname error msg
    ${error}=    Get Text    ${error_firstname}
    [Return]    ${error}

Get lastname error msg
    ${error}=    Get Text    ${error_lastname}
    [Return]    ${error}

Get email error msg
    ${error}=    Get Text    ${error_email}
    [Return]    ${error}

Get password error msg
    ${error}=   Get Text    ${error_password_must_6}
    [Return]    ${error}


Get confirmPasswoed error msg
    ${error}=   Get Text    ${error_confirmpass_notMatch}
    [Return]    ${error}

Get exist email error msg
    ${error}=   Get Text    ${error_email_exist}
    [Return]    ${error}

Close my browser
    Close All Browsers