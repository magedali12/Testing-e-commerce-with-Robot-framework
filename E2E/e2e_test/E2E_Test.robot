*** Settings ***
Library     SeleniumLibrary
Resource    ../e2e_keyword/E2E.robot
Suite Setup     Open my browser E
Suite Teardown  Close my browser E



*** Test Cases ***
E2E Test - Purchase Flow
    [Documentation]    Complete E2E Test - Login, Search, Add to Cart, Checkout, and Verify Order
    Set Selenium Speed    1 seconds
    Proceed To Checkout
