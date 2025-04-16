*** Settings ***
Documentation   To test the login functionality for NITSANON website
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser and navigate to NITSANON portal
Test Teardown   Close Browser
Resource        ./resources/resources.robot

*** Test Cases ***
#Validate login with valid credentials
#    Put valid credentials in the portal
#    Put credentials in the portal       ${C_USERNAME}       ${C_PASSWORD}
#    Click on submit button
#    Check the page is navigated to dashboard
    
#Validate login with invalid credentials
#    Put invalid credentials in the portal
#    Put credentials in the portal       ${IC_USERNAME}      ${IC_PASSWORD}
#    Click on submit button
#    Check the page is reloaded and not logged in

Validate story dates are present and equal
    Put credentials in the portal       ${C_USERNAME}       ${C_PASSWORD}
    Click on submit button
    Check the page is navigated to dashboard
    @{expected_DATE_OF_POST} =   Create List     2024-04-01 05:31:23     2024-04-01 05:31:10     2023-09-04 05:36:41     2023-08-13 01:04:28     2023-02-18 02:16:58

    ${elements} =   Get WebElements    ${DATE_OF_POST}

    @{actual_DATE_OF_POST} =     Create List

    FOR    ${element}    IN    @{elements}
        LOG     ${element.text}
        Append To List      ${actual_DATE_OF_POST}       ${element.text}
    END
    Lists Should Be Equal    ${expected_DATE_OF_POST}    ${actual_DATE_OF_POST}
    Log    len(${expected_DATE_OF_POST})
    Log    len(${actual_DATE_OF_POST})

Delete the story with particular title
    Put credentials in the portal       ${C_USERNAME}       ${C_PASSWORD}
    Click on submit button
    Check the page is navigated to dashboard
    Delete the story    This story is made to be deleted.







*** Keywords ***
Put credentials in the portal
    [Arguments]     ${username}	${password}
    Input Text    ${USERNAME_TEXTBOX}    ${username}
    Input Text    ${PASSWORD_TEXTBOX}    ${password}

Put valid credentials in the portal
#    [Arguments]   ${username}     ${password}
    Input Text    ${USERNAME_TEXTBOX}    ${C_USERNAME}
    Input Text    ${PASSWORD_TEXTBOX}    ${C_PASSWORD}

Put invalid credentials in the portal
    Input Text    ${USERNAME_TEXTBOX}    ${IC_USERNAME}
    Input Text    ${PASSWORD_TEXTBOX}    ${IC_PASSWORD}

Click on submit button
    Click Button    ${LOGIN_BTN}

Check the page is navigated to dashboard
    Title Should Be    ${EXPECTED_TITLE}
    
Check the page is reloaded and not logged in
    Title Should Be    ${EXPECTED_TITLE}

Delete the story
    [arguments]     ${story_name}
    ${elements} =   Get WebElements    ${STORIES}
    ${index}=   Set Variable    1
    @{actual_STORIES} =     Create List
    FOR    ${element}    IN    @{elements}
#        LOG     ${element.text}
        Exit for loop if    ${story_name} == ${element.text}
                ${index} += 1
#        Append To List      ${actual_STORIES}       ${element.text}
    END
    Click Button    xpath://div[@class='alert'][4]


