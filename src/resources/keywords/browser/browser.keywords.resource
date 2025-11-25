*** Settings ***
Resource    ../../../../init.resource


*** Keywords ***
Initialize Browser
    New Browser
    ...    browser=${BROWSER_TYPE}
    ...    headless=${HEADLESS_MODE}
    ...    args=["--start-maximized"]
    ...    timeout=${DEFAULT_TIMEOUT}
    New Context    viewport=${None}
    New Page    ${BROWSER.BASE_URL}/login

Navigate To Login Page
    Go To    ${BROWSER.BASE_URL}/login

Submit Login Credentials
    [Arguments]    ${username}    ${password}
    Fill Secret    \#username    $username
    Fill Secret    \#password    $password
    Click    button[type='submit']

Verify Alert Message
    [Arguments]    ${expected_message}
    VAR    ${alert_locator}=    //div[@id='flash' and contains(normalize-space(.), '${expected_message.strip()}')]
    Wait For Elements State
    ...    ${alert_locator}
    ...    state=stable
    Highlight Elements    ${alert_locator}
    Take Screenshot    log_screenshot=${True}

Verify Login Functionality
    [Arguments]    ${username}    ${password}    ${expected_message}
    Submit Login Credentials    ${username}    ${password}
    Verify Alert Message    ${expected_message}
