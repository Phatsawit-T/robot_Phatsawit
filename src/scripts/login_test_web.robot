*** Settings ***
Resource            ../../init.resource

Suite Setup         browser.keywords.Initialize Browser
Test Setup          browser.keywords.Navigate To Login Page
Test Template       browser.keywords.Verify Login Functionality


*** Test Cases ***    USERNAME    PASSWORD    EXPECTED_MESSAGE
Valid Login    tomsmith    SuperSecretPassword!    You logged into a secure area!
Invalid Password    tomsmith    Password!    Your password is invalid!
Invalid Username    tomholland    Password!    Your username is invalid!
