*** Settings ***
Documentation   To validate the logic form
Library     SeleniumLibrary

*** Test Cases ***
Validate addition
#    take 2 nos as input
    validate input  2   3


*** Keywords ***
#take 2 nos as input
#    i=2
#    j=3

validate input
    [Arguments]    ${num1}    ${num2}
    ${num3}=    Evaluate   ${num1}     +   ${num2}
    ${num3} ==  5

