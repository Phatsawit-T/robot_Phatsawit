*** Settings ***
Resource    ../../../../init.resource


*** Keywords ***
Validate Response Status Code
    [Arguments]    ${actual_status}    ${expected_status}

    IF    $actual_status != $expected_status
        Fail    ❌ Actual Status: ${actual_status}${\n}✅️ Expected Status: ${expected_status}
    END

Execute API Test    
    [Arguments]    ${alias}    ${test_case_name}
    # แปลงชื่อ test case จาก "Get User Profile Success" เป็น "get_user_profile_success" เพื่อใช้เรียกข้อมูลจากไฟล์ YAML
    VAR    ${test_data_key}    ${test_case_name.lower().replace(' ', '_')}

    # ส่ง HTTP request (GET, POST, PUT, DELETE ฯลฯ) ตาม METHOD ที่กำหนดใน YAML
    ${response}    Run Keyword
    ...    ${${test_data_key}.METHOD} On Session
    ...    alias=${alias}
    ...    url=${${test_data_key}.URL}
    ...    expected_status=any

    # ตรวจสอบ status code
    Validate Response Status Code    ${response.status_code}    ${${test_data_key}.STATUS}

    # ตรวจสอบโครงสร้างของ JSON response ตาม Schema ที่กำหนดใน YAML
    Validate Json By Schema    ${response.json()}    ${${test_data_key}.SCHEMA}
