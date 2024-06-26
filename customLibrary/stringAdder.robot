*** Settings ***
Library    StringAdder.py

*** Test Cases ***
String Addition Test
#    [Documentation]     Test addition of two strings
#    [Tags]      stringAddition
    ${result}=      Add Strings    Hello    World
    Should Be Equal As Strings    ${result}    HelloWorld
