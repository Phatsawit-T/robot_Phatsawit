*** Settings ***
Variables       ../../data/api.data.yaml
Resource        ../../init.resource

Suite Setup     RequestsLibrary.Create Session
...                 alias=${SUITE_NAME}
...                 url=${API.BASE_URL}
...                 headers=${API.AUTH_KEY}
...                 verify=${False}


*** Test Cases ***
Get User Profile Success
    Execute API Test    ${SUITE_NAME}    ${TEST_NAME}

Get User Profile but user not found
    Execute API Test    ${SUITE_NAME}    ${TEST_NAME}
