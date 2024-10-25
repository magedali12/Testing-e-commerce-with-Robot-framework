*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Search.robot
Suite Setup  Open my browser
Suite Teardown  Close my browser

*** Variables ***

${search_data}=  TCP
${search_with_wrong_data}=  dfhdf

*** Test Cases ***
Search Product
    Click on search field
    Enter the search data    ${search_data}
    Click on button search
    Verify product visibility    ${search_data}
    Select sort by price low to high
    Select sort by price high to low
    Select view mode by list
    Verify list mode is displayed

#search with wrong data
1-Wrong Search
    Click on search field
    Enter the search data    ${search_with_wrong_data}
    Click on button search
    Verify error msg is displayed

#search with blank input
2-Wrong Search
    Click on search field
    Enter the search data    ${EMPTY}
    Click on button search
    Alert Should Be Present  Please enter some search keyword


