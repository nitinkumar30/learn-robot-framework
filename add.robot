*** Test Cases ***
Addition Test
    [Documentation]     Test addition functionality
    [Tags]  addition
    ${result} =     Add Numbers    2   3
    Should Be Equal As Numbers    ${result}    5

*** Keywords ***
Add Numbers
    [Arguments]     ${num1}   ${num2}
    ${result} =   Evaluate    ${num1} + ${num2}
#    RETURN    ${result}
    [Return]    ${result}
