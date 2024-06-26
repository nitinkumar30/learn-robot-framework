#Documentation - https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Teardown   Close Browser

*** Test Cases ***
Validate UnSuccessful login
    open the browser with the mortgage payment url
    Fill the login form
#    Wait Until Keyword Succeeds    5s    1s    Click Button    class=signInBtn
    Wait until it checks and displays error message
    Verify error message is correct
#    [Teardown]  Close Browser

*** Variables ***
${IMPLICIT_WAIT}    5
${ERRORMSG_xpath}   //p[@class='error']
${USERNAME}     nitinkr
${PASSWORD}     kumarnit

*** Keywords ***
open the browser with the mortgage payment url
    Open Browser    https://rahulshettyacademy.com/locatorspractice/    Chrome

Fill the login form
    Input Text              id=inputUsername        ${USERNAME}
#    Set Selenium Speed      ${IMPLICIT_WAIT}
    Input Password          name=inputPassword      ${PASSWORD}
#    Set Selenium Speed      ${IMPLICIT_WAIT}
    Click Button            class=signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Enabled    class=error

Verify error message is correct
#    ${result}=  Get Text    class=error
#    Should Be Equal As Strings    ${result}    * Incorrect username or password

    Element Text Should Be    class=error    * Incorrect username or password


