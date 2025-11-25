*** Settings ***
Resource    ../../init.resource


*** Keywords ***
Check List Duplicate
    [Arguments]    ${list_one}    ${list_two}
    ${dup_value}    Evaluate    set($list_one) & set($list_two)
    RETURN    ${dup_value}

