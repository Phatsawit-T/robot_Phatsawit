*** Settings ***
Documentation       Test Automation Assignment - Question 3: REST API GET Request Testing
...
...                 Create automation script for testing REST API GET request.
...                 Test scenarios: Send GET request to URL: https://reqres.in/api/users/{id}
...
...                 **API Endpoint:** https://reqres.in/api/users
...
...                 **Test Cases:**
...                 1. Get user profile success (ID: 12)
...                 2. Get user profile but user not found (ID: 1234)

Variables           ../../data/api.data.yaml
Resource            ../../init.resource

Suite Setup         RequestsLibrary.Create Session
...                     alias=${SUITE_NAME}
...                     url=${API.BASE_URL}
...                     headers=${API.AUTH_KEY}
...                     verify=${False}


*** Test Cases ***
Get User Profile Success
    [Documentation]    Test Case: Verify GET user profile API returns correct data for existing user
    ...
    ...    **Objective:**
    ...    To verify get user profile API will return correct data
    ...    when trying to get profile of existing user
    ...
    ...    **Test Steps:**
    ...    1. Send GET request to URL: https://reqres.in/api/users/12
    ...
    ...    **Expected Results:**
    ...    1. Verify response status code should be '200'
    ...    2. Compare the response body with expected:
    ...    - ID == 12
    ...    - Email == rachel.howell@reqres.in
    ...    - First Name == Rachel
    ...    - Last Name == Howell
    ...    - Avatar == https://reqres.in/img/faces/12-image.jpg
    [Tags]    api    p0    get    positive    assignment_q3

    Execute API Test    ${SUITE_NAME}    ${TEST_NAME}

Get User Profile but user not found
    [Documentation]    Test Case: Verify GET user profile API returns 404 for non-existing user
    ...
    ...    **Objective:**
    ...    To verify get user profile API will return 404 not found
    ...    when trying to get profile of not existing user
    ...
    ...    **Test Steps:**
    ...    1. Send GET request to URL: https://reqres.in/api/users/1234
    ...
    ...    **Expected Results:**
    ...    1. Verify response status code should be '404'
    ...    2. Response body should be '{}'
    [Tags]    api    p0    get    negative    assignment_q3

    Execute API Test    ${SUITE_NAME}    ${TEST_NAME}
