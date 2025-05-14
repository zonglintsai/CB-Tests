*** Settings ***
Library  AppiumLibrary

*** Variables ***
${REMOTE_URL}        http://localhost:4723
${PLATFORM_NAME}     iOS
${PLATFORM_VERSION}  18.3
${DEVICE_NAME}       iPhone 16 Pro
${BROWSER_NAME}      Safari
${AUTOMATION_NAME}   XCUITest

*** Keywords ***
Open Appium with iOS
    Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE_NAME}  browserName=${BROWSER_NAME}  automationName=${AUTOMATION_NAME}

Close Appium
    Close Application
