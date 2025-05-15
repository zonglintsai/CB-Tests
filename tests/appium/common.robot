*** Variables ***
${DEFAULT_TIMEOUT}  10s
${DEFAULT_SLEEP}  0.3s

*** Keywords ***
Wait And Click  
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  timeout=${DEFAULT_TIMEOUT}
    Click Element  ${element}
    Sleep  ${DEFAULT_SLEEP}
    Capture Page Screenshot

Element Class Attribute Should Match Regexp
    [Arguments]  ${element}  ${regexp}
    Element Attribute Should Match  ${element}  class  ${regexp}  regexp=True
    Scroll Element Into View  ${element}
    Capture Page Screenshot
