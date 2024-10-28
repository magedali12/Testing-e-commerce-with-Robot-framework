*** Settings ***
Library     SeleniumLibrary
Variables       ../../PageObjects/Locators.py
Resource        ../../Resources/AddToCartAndCheckout.robot
Resource        ../../Resources/Login_resources.robot
Resource        ../../Resources/Search.robot



*** Variables ***
${url}      https://demowebshop.tricentis.com/login
${browser}      chrome
${email}     migzz15@test.com
${password}     123456
${Product_name}     14.1-inch Laptop
${city}     cairo
${address}      giza
${postal_code}      12358
${phone}        0112457856
${payment1}     Payments.CashOnDelivery


*** Keywords ***
Open my browser E
    Open Browser    ${url}      ${browser}
    Maximize Browser Window


Proceed To Checkout
    Login As Registered User
    Search And Select Product
    Add Product To Cart And Go To Cart
    Checkout
    Place Order


Login As Registered User
    [Documentation]   Login as an existing user using the LoginPage keywords.
    Login_resources.Valid_Login    ${email}    ${password}

Search And Select Product
    [Documentation]   Search for a product and select it.
    Search.Search Product    ${Product_name}
    Search.Select Product

Add Product To Cart And Go To Cart
    [Documentation]   Add a product to the cart.
    AddToCartAndCheckout.Add Product To Cart

Checkout
    [Documentation]    proceed to checkout.
    AddToCartAndCheckout.Checkout And Enter Details    ${city}    ${address}    ${postal_code}    ${phone}    ${payment1}

Place Order
    [Documentation]    Complete the order.
    AddToCartAndCheckout.Confirm Order And Make Sure It's Successful


Close my browser E
    Close All Browsers
