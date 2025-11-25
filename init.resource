*** Settings ***
Library         Collections
Library         Browser
Library         RequestsLibrary
Library         JSONLibrary
Variables       env.cofig.yaml
Variables       src/resources/variables/common.yaml
Resource        src/resources/keywords/api/api.keywords.resource
Resource        src/resources/specifics.resource
Resource        src/resources/keywords/browser/browser.keywords.resource
Resource        src/resources/keywords/mobile/mobile.keywords.resource
Library         AppiumLibrary
