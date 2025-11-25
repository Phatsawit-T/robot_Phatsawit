*** Settings ***
Documentation       Test Automation Assignment - Question 6: Caesar Cipher Decryption
...
...                 A simple cipher is built on the alphabet wheel which has uppercase English letters ['A'-'Z'] written on it.
...                 Given an encrypted string consisting of English letters ['A'-'Z'] only, decrypt the string by replacing
...                 each character with the kth character away on the wheel in the counterclockwise direction.
...
...                 Example:
...                 - encrypted = 'VTAOG'
...                 - k = 2
...                 - Result = 'TRYME'
...
...                 Looking back 2 from 'V' returns 'T', from 'T' returns 'R' and so on.

Library             ../resources/lib/customlib.py


*** Test Cases ***
Decrypt Caesar Cipher - Example Case (VTAOG -> TRYME)
    [Documentation]    Test Case: Verify Caesar cipher decryption with example data
    ...
    ...    **Test Data:**
    ...    - Encrypted String: VTAOG
    ...    - Shift Value (k): 2
    ...
    ...    **Expected Result:**
    ...    - Decrypted String: TRYME
    ...
    ...    **Decryption Logic:**
    ...    - V - 2 = T
    ...    - T - 2 = R
    ...    - A - 2 = Y (wraps around from A to Z)
    ...    - O - 2 = M
    ...    - G - 2 = E
    [Tags]    cipher    p0    example

    ${result}=    customlib.Caesar Decrypt    encrypted=VTAOG    k=2
    Should Be Equal    ${result}    TRYME
    Log    Encrypted: VTAOG, k=2 -> Decrypted: ${result}    console=${True}

Decrypt Caesar Cipher - Different Shift Value
    [Documentation]    Test Case: Verify Caesar cipher decryption with different shift value
    ...
    ...    **Test Data:**
    ...    - Encrypted String: DEF
    ...    - Shift Value (k): 3
    ...
    ...    **Expected Result:**
    ...    - Decrypted String: ABC
    [Tags]    cipher    p1

    ${result}=    customlib.Caesar Decrypt    encrypted=DEF    k=3
    Should Be Equal    ${result}    ABC
    Log    Encrypted: DEF, k=3 -> Decrypted: ${result}    console=${True}

Decrypt Caesar Cipher - With Wrap Around
    [Documentation]    Test Case: Verify Caesar cipher decryption handles wrap around from A to Z
    ...
    ...    **Test Data:**
    ...    - Encrypted String: ABC
    ...    - Shift Value (k): 5
    ...
    ...    **Expected Result:**
    ...    - Decrypted String: VWX (wraps around alphabet)
    [Tags]    cipher    p1    edge_case

    ${result}=    customlib.Caesar Decrypt    encrypted=ABC    k=5
    Should Be Equal    ${result}    VWX
    Log    Encrypted: ABC, k=5 -> Decrypted: ${result}    console=${True}
