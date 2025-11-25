*** Settings ***
Documentation       Test Automation Assignment - Question 2: Web Login Testing
...
...                 Create automation script to test website 'http://the-internet.herokuapp.com/login'
...                 following test cases:
...
...                 **Login Credentials:**
...                 - Username: tomsmith
...                 - Password: SuperSecretPassword!
...
...                 **Test Cases:**
...                 1. Login success - Verify users can login successfully with correct credentials
...                 2. Login failed - Password incorrect
...                 3. Login failed - Username not found

Resource            ../../init.resource

Suite Setup         browser.keywords.Initialize Browser
Test Setup          browser.keywords.Navigate To Login Page
Test Template       browser.keywords.Verify Login Functionality


*** Test Cases ***    USERNAME    PASSWORD    EXPECTED_MESSAGE
Valid Login    tomsmith    SuperSecretPassword!    You logged into a secure area!
Invalid Password    tomsmith    Password!    Your password is invalid!
Invalid Username    tomholland    Password!    Your username is invalid!
