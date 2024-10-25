*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/AddToCart.robot
Suite Setup  Open my browser
Suite Teardown  Close my browser


*** Test Cases ***
Add first product to the cart
    Click Add To The Cart First Product
    Verify product has been added to cart
    Verify the cart counter has been increased by one
    Go to the cart
    Go to home page


Add second product to the cart
    Click Add To The Cart Second Product
    Customice The Product
    Verify product has been added to cart
    Verify the cart counter has been increased by two
    Go to the cart
