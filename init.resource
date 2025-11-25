*** Settings ***
# ================================ Library ==========================================
Library         Collections
Library         Browser
Library         RequestsLibrary
Library         JSONLibrary
Library         AppiumLibrary
#
# ================================ Variables ========================================
#
Variables       env.cofig.yaml
Variables       src/resources/variables/common.yaml
#
# ================================ Resource =========================================
#
Resource        src/resources/specifics.resource
Resource        src/resources/keywords/api/api.keywords.resource
Resource        src/resources/keywords/mobile/mobile.keywords.resource
Resource        src/resources/keywords/browser/browser.keywords.resource
