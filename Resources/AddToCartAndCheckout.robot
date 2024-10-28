*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/Locators.py


*** Keywords ***
Open my browser
    Open Browser    https://demowebshop.tricentis.com/      chrome
    Maximize Browser Window

Click Add To Cart
    Click Element    ${inch_add}

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


Remove the products from the cart
    Wait Until Page Contains Element    ${remove_checkbox_first_product}
    Select Checkbox    ${remove_checkbox_first_product}
    Select Checkbox    ${remove_checkbox_second_product}
    Click Element    ${update_cart_btn}
    Sleep    3

Go to the cart
    Click Link    Shopping cart
    Sleep    3

Go to home page
    Click Element    ${go_to_home_page}
    Sleep    3

Verify product has been added to cart
    Wait Until Page Contains    The product has been added to your
    Page Should Contain    The product has been added to your
    
Verify the cart is empty
    Page Should Contain    Your Shopping Cart is empty!

Verify the cart counter has been decreased by one
    Page Should Contain    (1)

Verify the cart counter has been decreased by two
    Page Should Contain    (0)

Verify the cart counter has been increased by one
    Page Should Contain    (1)
    
Verify the cart counter has been increased by two
    Page Should Contain    (2)   

Click on termsofservice
    Select Checkbox    ${the_terms_of_service_checkbox}

Click on checkout
    Click Element    ${checkout_btn}
    
Click on new address
    Wait Until Page Contains Element    billing_address_id
    Select From List By Label    billing_address_id     New Address

Select country
    Wait Until Page Contains Element    ${billing_country_dropdown}
    Select From List By Label    ${billing_country_dropdown}    Egypt

Enter city
    [Arguments]     ${city}
    Input Text    ${billing_city}    ${city}

Enter address
    [Arguments]     ${address}
    Input Text    ${billing_address1}    ${address}

Enter postal code
    [Arguments]     ${postal_code}
    Input Text    ${billing_postalcode}    ${postal_code}

Enter phone number
    [Arguments]     ${phone}
    Input Text    ${billing_phonenumber}    ${phone}

Click on continue1
    Wait Until Page Contains Element    ${billing_continue1}
    Click Element    ${billing_continue1}

click on in store checkbox
    Wait Until Page Contains Element    ${shipping_instore}
    Select Checkbox    ${shipping_instore}

Click on continue shipping_save
    Click Element    ${shipping_continue2}


Select payment method
    [Arguments]     ${method}
    Wait Until Page Contains Element    ${payment_method}
    Select Radio Button    ${payment_method}    ${method}

Click on continue payment_save
    Click Element    ${payment_continue3}

Verify payment method cash on delivery
    Wait Until Page Contains    You will pay by COD
    Page Should Contain    You will pay by COD

Click on continue payment_info_save
    Click Element    ${paymentinfo_continue4}

Click on confirm order
    Wait Until Page Contains Element    ${confirm_order_btn}
    Click Element    ${confirm_order_btn}

Verify Order is Successfully Processed
    Wait Until Page Contains    Your order has been successfully processed!
    Page Should Contain    Your order has been successfully processed!

Click continue to go to home page
    Click Element    ${continue_to_homapage}

#e2e
Add Product To Cart
    Click Add To Cart
    Verify product has been added to cart
    Go to the cart

#e2e
#Payments.CashOnDelivery
Checkout And Enter Details
    [Arguments]     ${city}     ${address}      ${postal_code}      ${phone}    ${Payment_Method}
    Click on termsofservice
    Click on checkout
    Click on new address
    Select country
    Enter city     ${city}
    Enter address      ${address}
    Enter postal code      ${postal_code}
    Enter phone number     ${phone}
    Click on continue1
    click on in store checkbox
    Click on continue shipping_save
    Select payment method      ${Payment_Method}
    Click on continue payment_save
    Verify payment method cash on delivery
    Click on continue payment_info_save

Confirm Order And Make Sure It's Successful
    Click on confirm order
    Verify Order is Successfully Processed
    Click continue to go to home page

Close my browser
    Close All Browsers