*** Settings ***
Resource    ../../init.resource


*** Variables ***
@{List_A}       1    2    3    5    6    8    9
@{List_B}       3    2    1    5    6    0


*** Test Cases ***
Check Duplicate List
    ${dup_value}    specifics.Check List Duplicate    ${List_A}    ${List_B}
    Log    Duplicate value is : ${dup_value}    console=${True}
