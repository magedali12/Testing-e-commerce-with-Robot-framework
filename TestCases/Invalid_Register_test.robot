*** Settings ***
Library  SeleniumLibrary
Library     DataDriver   ../TestData/RegisterData.csv
Resource    ../Resources/Register_resources.robot
Suite Setup  Open my browser    ${url}    ${browser}
Suite Teardown  Close my browser
Test Template   Invalid Register

*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome


*** Test Cases ***
Register with Csv  using ${gender} and  ${firstname} and  ${lastname} and  ${email} and  ${password} and  ${confirmpassword} and  ${firstname_error} and  ${lastname_error} and  ${email_error} and  ${password_error} and  ${confirmpassword_error}


*** Keywords ***
Invalid Register
    [Arguments]     ${gender}  ${firstname}  ${lastname}  ${email}  ${password}  ${confirmpassword}  ${firstname_error}  ${lastname_error}  ${email_error}  ${password_error}  ${confirmpassword_error}
    #Set Selenium Implicit Wait    5 seconds
    Open register page from header
    Select gender    ${gender}
    Enter firstname    ${firstname}
    Enter lastname    ${lastname}
    Enter email    ${email}
    Enter password    ${password}
    Enter confirmpassword    ${confirmpassword}
    Click register btn


    # Get error messages
    ${actual_firstname_error}=  Get firstname error msg
    Log To Console    ${actual_firstname_error}
    ${actual_lastname_error}=   Get lastname error msg
    Log To Console    ${actual_lastname_error}
    ${actual_email_error}=  Get email error msg
    Log To Console    ${actual_email_error}
    ${actual_password_error}=   Get password error msg
    Log To Console    ${actual_password_error}
    ${actual_confirm_password_error}=   Get confirmPasswoed error msg
    Log To Console     ${actual_confirm_password_error}


    # Validate error messages
    Should Be Equal    ${actual_firstname_error}    ${firstname_error}
    Should Be Equal    ${actual_lastname_error}    ${lastname_error}
    Should Be Equal    ${actual_email_error}    ${email_error}
    Should Be Equal    ${actual_password_error}    ${password_error}
    Should Be Equal    ${actual_confirm_password_error}    ${confirmpassword_error}
    #Should Be Equal    ${actual_existEmail_error}    ${existEmail_error}
    #Verify valid register
    #Verify invalid register
    #Click on continue
    #Verify go to home page

