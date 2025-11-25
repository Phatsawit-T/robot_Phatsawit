*** Settings ***
Resource            ../../init.resource

Suite Setup         mobile.keywords.Open Mobile Application
Suite Teardown      AppiumLibrary.Close All Applications
Test Setup          mobile.keywords.Prepare Clean State
Test Teardown       mobile.keywords.Capture Screenshot On Failure


*** Test Cases ***
TC-001 Verify App Launch Successfully
    [Documentation]    ทดสอบการเปิดแอปพลิเคชันสำเร็จ
    ...
    ...    **Preconditions:**
    ...    - Appium Server กำลังรัน
    ...    - Emulator/Device เชื่อมต่อแล้ว
    ...
    ...    **Test Steps:**
    ...    1. เปิดแอป Minimal Todo
    ...    2. ตรวจสอบว่าแอปเปิดสำเร็จ
    ...
    ...    **Expected Results:**
    ...    - แสดง App Title "Minimal"
    ...    - แสดงข้อความ "You don't have any todos"
    [Tags]    smoke    p0    sanity

    mobile.keywords.Verify App Title Displayed
    mobile.keywords.Verify Empty State Message

TC-002 Add Single Todo Item
    [Documentation]    ทดสอบการเพิ่มรายการ Todo ครั้งละ 1 รายการ
    ...
    ...    **Test Steps:**
    ...    1. คลิกปุ่ม Add Todo
    ...    2. กรอกข้อความ "Buy Groceries"
    ...    3. บันทึกรายการ
    ...
    ...    **Expected Results:**
    ...    - รายการ "Buy Groceries" ถูกเพิ่มและแสดงในรายการ
    [Tags]    functional    p0    crud

    mobile.keywords.Add Todo Item    Buy Groceries
    mobile.keywords.Verify Todo Item Exists    Buy Groceries

TC-003 Add Multiple Todo Items
    [Documentation]    ทดสอบการเพิ่มรายการ Todo หลายรายการ
    ...
    ...    **Test Steps:**
    ...    1. เพิ่มรายการที่ 1: "Buy groceries"
    ...    2. เพิ่มรายการที่ 2: "Do laundry"
    ...    3. เพิ่มรายการที่ 3: "Pay bills"
    ...
    ...    **Expected Results:**
    ...    - ทั้ง 3 รายการแสดงในรายการ
    [Tags]    functional    p1    crud

    VAR    @{todo_items}=
    ...    Buy groceries
    ...    Do laundry
    ...    Pay bills

    FOR    ${item}    IN    @{todo_items}
        mobile.keywords.Add Todo Item    ${item}
    END

    FOR    ${item}    IN    @{todo_items}
        mobile.keywords.Verify Todo Item Exists    ${item}
    END

TC-004 Delete Single Todo Item
    [Documentation]    ทดสอบการลบรายการ Todo ครั้งละ 1 รายการ
    ...
    ...    **Test Steps:**
    ...    1. เพิ่มรายการ "Task to delete"
    ...    2. ลบรายการที่เพิ่ม
    ...
    ...    **Expected Results:**
    ...    - รายการถูกลบและไม่แสดงในรายการ
    ...    - แสดงข้อความ empty state
    [Tags]    functional    p0    crud

    mobile.keywords.Add Todo Item    Task to delete
    mobile.keywords.Verify Todo Item Exists    Task to delete
    mobile.keywords.Delete Todo Item    Task to delete
    mobile.keywords.Verify Todo Item Deleted    Task to delete
    mobile.keywords.Verify Empty State Message

TC-005 Add Todo With Special Characters
    [Documentation]    ทดสอบการเพิ่มรายการที่มีอักขระพิเศษ
    ...
    ...    **Test Data:**
    ...    - อักขระพิเศษ: !@#$%^&*()_+-=[]{}
    ...
    ...    **Expected Results:**
    ...    - ระบบรองรับและแสดงอักขระพิเศษได้ถูกต้อง
    [Tags]    functional    p2    input_validation

    ${special_text}=    Set Variable    Test!@#$%^&*()_+-=
    mobile.keywords.Add Todo Item    ${special_text}
    mobile.keywords.Verify Todo Item Exists    ${special_text}

TC-006 Add Todo With Unicode Characters
    [Documentation]    ทดสอบการเพิ่มรายการที่มีอักขระ Unicode หลายภาษา
    ...
    ...    **Test Data:**
    ...    - ไทย: สวัสดี
    ...    - ญี่ปุ่น: こんにちは
    ...    - อีโมจิ: ✨ 🎉 📝
    ...
    ...    **Expected Results:**
    ...    - ระบบรองรับและแสดง Unicode ได้ถูกต้อง
    [Tags]    functional    p2    input_validation    i18n

    ${unicode_text}=    Set Variable    สวัสดี ✨ Hello こんにちは 🎉
    mobile.keywords.Add Todo Item    ${unicode_text}
    mobile.keywords.Verify Todo Item Exists    ${unicode_text}

TC-007 Add Todo With Empty Text
    [Documentation]    ทดสอบการเพิ่มรายการด้วยข้อความว่าง (Negative Test)
    ...
    ...    **Test Steps:**
    ...    1. คลิกปุ่ม Add Todo
    ...    2. ไม่กรอกข้อความ (ปล่อยว่าง)
    ...    3. พยายามบันทึก
    ...
    ...    **Expected Results:**
    ...    - ระบบไม่อนุญาตให้บันทึก หรือ
    ...    - แสดงข้อความแจ้งเตือน
    [Tags]    negative    p1    input_validation    boundary

    mobile.keywords.Click Add Todo Button
    mobile.keywords.Enter Todo Text    ${EMPTY}
    mobile.keywords.Click Save Button

    # ตรวจสอบว่ายังคงอยู่ในหน้าเพิ่ม Todo หรือกลับไปหน้าหลักโดยไม่มีรายการ
    mobile.keywords.Verify Empty State Message

TC-008 Add Duplicate Todo Items
    [Documentation]    ทดสอบการเพิ่มรายการที่ซ้ำกัน
    ...
    ...    **Test Steps:**
    ...    1. เพิ่มรายการ "Duplicate Task"
    ...    2. เพิ่มรายการ "Duplicate Task" อีกครั้ง
    ...
    ...    **Expected Results:**
    ...    - ระบบอนุญาตให้เพิ่มรายการซ้ำได้
    [Tags]    functional    p2    business_logic

    mobile.keywords.Add Todo Item    Duplicate Task
    mobile.keywords.Add Todo Item    Duplicate Task

    ${count: int}=    mobile.keywords.Count Todo Items    Duplicate Task
    IF    $count < 2
        Fail    Expected at least 2 duplicate items, but found ${count}
    END
