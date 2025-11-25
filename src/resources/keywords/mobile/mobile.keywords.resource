*** Settings ***
Resource    ../../../../init.resource


*** Variables ***
# หน้าหลัก (Main Screen)
${APP_TITLE}            xpath=//android.widget.TextView[@text="Minimal"]
${EMPTY_MESSAGE}        xpath=//android.widget.TextView[@text="You don't have any todos"]
${ADD_BUTTON}           id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB

# หน้าเพิ่ม/แก้ไข Todo (Add/Edit Screen)
${TODO_INPUT}           id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
${SAVE_BUTTON}          id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
${BACK_BUTTON}          xpath=//android.widget.ImageButton[@content-desc="Navigate up"]

# Remind Me Section
${REMIND_SWITCH}        id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
${REMIND_ICON}          id=com.avjindersinghsekhon.minimaltodo:id/userToDoReminderIconImageButton
${REMIND_TEXT}          id=com.avjindersinghsekhon.minimaltodo:id/userToDoRemindMeTextView

# Todo List Items
${TODO_ITEM_XPATH}      //android.widget.TextView[contains(@resource-id, 'toDoListItemTextview')]


*** Keywords ***
Open Mobile Application
    [Documentation]    เปิด Mobile Application ด้วย Appium
    ...    - อ่านค่า Configuration จาก YAML
    ...    - เปิด Application บน Device ที่กำหนด

    AppiumLibrary.Open Application
    ...    ${Mobile.REMOTE_URL}
    ...    platformName=${Mobile.PLATFORMNAME}
    ...    platformVersion=${Mobile.PLATFORMVERSION}
    ...    deviceName=${Mobile.DEVICENAME}
    ...    udid=${Mobile.UDID}
    ...    appPackage=${Mobile.APPPACKAGE}
    ...    appActivity=${Mobile.APPACTIVITY}
    ...    automationName=${Mobile.AUTOMATIONNAME}
    ...    unicodeKeyboard=${Mobile.UNICODEKEYBOARD}
    ...    resetKeyboard=${Mobile.RESETKEYBOARD}
    ...    noReset=${Mobile.NORESET}
    ...    newCommandTimeout=${Mobile.NEWCOMMANDTIMEOUT}
    ...    autoGrantPermissions=${Mobile.AUTOGRANTPERMISSIONS}
    ...    autoAcceptAlerts=${Mobile.AUTOACCEPTALERTS}

    Log To Console    ✅ Connected to Mobile Device: ${Mobile.UDID}
    Wait Until Element Is Visible    ${APP_TITLE}    timeout=10s

Prepare Clean State
    [Documentation]    เตรียมสถานะเริ่มต้นก่อนแต่ละ Test Case - ลบ Todo ทั้งหมด (ถ้ามี)

    ${status}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    xpath=${TODO_ITEM_XPATH}    timeout=3s

    IF    ${status}    Delete All Todo Items

Capture Screenshot On Failure
    [Documentation]    ถ่ายภาพหน้าจอเมื่อ Test Case ล้มเหลว

    Run Keyword If Test Failed    Capture Page Screenshot

Verify App Title Displayed
    [Documentation]    ตรวจสอบว่าแสดง App Title

    Wait Until Element Is Visible    ${APP_TITLE}    timeout=10s
    Element Should Be Visible    ${APP_TITLE}

Verify Empty State Message
    [Documentation]    ตรวจสอบข้อความ "You don't have any todos"

    Wait Until Element Is Visible    ${EMPTY_MESSAGE}    timeout=10s
    Element Should Be Visible    ${EMPTY_MESSAGE}

Click Add Todo Button
    [Documentation]    คลิกปุ่ม Add Todo

    Wait Until Element Is Visible    ${ADD_BUTTON}    timeout=10s
    Click Element    ${ADD_BUTTON}

Enter Todo Text
    [Documentation]    กรอกข้อความ Todo
    [Arguments]    ${text}

    Wait Until Element Is Visible    ${TODO_INPUT}    timeout=10s
    Input Text    ${TODO_INPUT}    ${text}

Click Save Button
    [Documentation]    คลิกปุ่ม Save

    Wait Until Element Is Visible    ${SAVE_BUTTON}    timeout=10s
    Click Element    ${SAVE_BUTTON}

Add Todo Item
    [Documentation]    เพิ่มรายการ Todo แบบครบวงจร
    [Arguments]    ${todo_text}

    Click Add Todo Button
    Enter Todo Text    ${todo_text}
    Click Save Button
    Sleep    1s

Verify Todo Item Exists
    [Documentation]    ตรวจสอบว่ารายการ Todo มีอยู่
    [Arguments]    ${todo_text}

    VAR    ${todo_xpath}=    xpath=//android.widget.TextView[@text="${todo_text}"]
    Wait Until Element Is Visible    ${todo_xpath}    timeout=10s
    Element Should Be Visible    ${todo_xpath}

Delete Todo Item
    [Documentation]    ลบรายการ Todo โดยการ Swipe
    [Arguments]    ${todo_text}

    VAR    ${todo_xpath}=    xpath=//android.widget.TextView[@text="${todo_text}"]
    Wait Until Element Is Visible    ${todo_xpath}    timeout=10s

    ${location}=    Get Element Location    ${todo_xpath}
    ${size}=    Get Element Size    ${todo_xpath}

    ${start_x}=    Evaluate    ${location['x']} + ${size['width']} * 0.8
    ${end_x}=    Evaluate    ${location['x']} + ${size['width']} * 0.2
    ${y}=    Evaluate    ${location['y']} + ${size['height']} * 0.5

    Swipe    ${start_x}    ${y}    ${end_x}    ${y}    1000
    Sleep    1s

Verify Todo Item Deleted
    [Documentation]    ตรวจสอบว่ารายการ Todo ถูกลบแล้ว
    [Arguments]    ${todo_text}
    Wait Until Page Does Not Contain Element    xpath=//android.widget.TextView[@text="${todo_text}"]    timeout=10s

Delete All Todo Items
    [Documentation]    ลบรายการ Todo ทั้งหมด
    ${count}=    AppiumLibrary.Get Matching Xpath Count    xpath=${TODO_ITEM_XPATH}
    FOR    ${index}    IN RANGE    ${count}
        ${text}=    AppiumLibrary.Get Text    xpath=(${TODO_ITEM_XPATH})[1]
        Delete Todo Item    ${text}
    END

Count Todo Items
    [Documentation]    นับจำนวนรายการ Todo ที่มีข้อความตรงกัน
    [Arguments]    ${todo_text}
    ${count}=    AppiumLibrary.Get Matching Xpath Count    xpath=//android.widget.TextView[@text="${todo_text}"]
    RETURN    ${count}
