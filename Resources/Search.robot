*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/Locators.py


*** Keywords ***
Open my browser
    Open Browser    https://demowebshop.tricentis.com/      chrome
    Maximize Browser Window

Click on search field
    Wait Until Page Contains Element    ${search_input}
    Click Element    ${search_input}

Enter the search data
    [Arguments]     ${search_data}
    Input Text    ${search_input}    ${search_data}

Click on button search
    Click Element    ${search_btn}


Verify product visibility
    [Arguments]     ${search_data}
    Page Should Contain    ${search_data}

Select sort by price low to high
    Execute Javascript  window.scrollTo(0,300)
    Wait Until Page Contains Element    ${search_sortby_dropdown}
    Select From List By Index    ${search_sortby_dropdown}  3
    Sleep    2

Select sort by price high to low
    Execute Javascript  window.scrollTo(0,300)
    Wait Until Page Contains Element    ${search_sortby_dropdown}
    Select From List By Index    ${search_sortby_dropdown}  4
    Sleep    2


Select view mode by list
    Execute Javascript  window.scrollTo(0,300)
    Wait Until Page Contains Element    ${search_viewmode_dropdown}
    Select From List By Index    ${search_viewmode_dropdown}  1
    Sleep    2

Verify list mode is displayed
    ${current_url}=  Get Location
    Log To Console    ${current_url}
    Should Be Equal    ${current_url}    https://demowebshop.tricentis.com/search?q=tcp&orderby=11&viewmode=list

Verify error msg is displayed
    Page Should Contain    No products were found that matched your criteria.


Search Product
    [Arguments]     ${search_data}
    Click on search field
    Enter the search data    ${search_data}
    Click on button search
    Verify product visibility    ${search_data}

Select Product
    Wait Until Page Contains Element    ${inch_link}
    Click Link    ${inch_link}


Close my browser
    Close All Browsers




