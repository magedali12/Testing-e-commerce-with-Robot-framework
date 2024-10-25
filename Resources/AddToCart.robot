*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/Locators.py


*** Keywords ***
Open my browser
    Open Browser    https://demowebshop.tricentis.com/      chrome
    Maximize Browser Window

Click Add To The Cart First Product
    Click Element    ${inch_product_add_btn}
    Sleep    2

Click Add To The Cart Second Product
    Click Element    ${Build_your_own_computer_product_add_btn}
    Sleep    2
    
Customice The Product
    Wait Until Page Contains Element    ${Build_your_own_computer_customice_add_btn}
    Select Radio Button    product_attribute_16_3_6    19
    Click Element    ${Build_your_own_computer_customice_add_btn}
    Sleep    2

Go to the cart
    Click Link    Shopping cart
    Sleep    5

Go to home page
    Click Element    ${go_to_home_page}
    Sleep    3


Verify product has been added to cart
    Page Should Contain    The product has been added to your

Verify the cart counter has been increased by one
    Page Should Contain    (1)
    
Verify the cart counter has been increased by two
    Page Should Contain    (2)   

Close my browser
    Close All Browsers