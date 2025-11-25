*** Settings ***
Documentation       Test Automation Assignment - Question 1: Check Duplicate Items from List A and List B
...
...                 Check duplicate items from list A and list B and append to a new list.
...                 Using preferred programming language.
...
...                 **Test Data:**
...                 - List A: [1, 2, 3, 5, 6, 8, 9]
...                 - List B: [3, 2, 1, 5, 6, 0]
...
...                 **Expected Result:**
...                 - Duplicate items: [1, 2, 3, 5, 6]

Resource            ../../init.resource


*** Variables ***
@{List_A}       1    2    3    5    6    8    9
@{List_B}       3    2    1    5    6    0


*** Test Cases ***
Check Duplicate List
    ${dup_value}    specifics.Check List Duplicate    ${List_A}    ${List_B}
    Log    Duplicate value is : ${dup_value}    console=${True}
