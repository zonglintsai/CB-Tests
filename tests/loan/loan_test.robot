*** Settings ***
Library  AppiumLibrary
Resource  elements.robot
Resource  ../appium/ios.robot
Resource  ../appium/common.robot
Test Setup  Open Appium with iOS
Suite Teardown  Close Appium

*** Test Cases ***
Loan Calculation Success
    [Tags]  Q
    Given Go To Url  ${LOAN_PAGE}
    When Wait And Click  ${CITY_TAIPEI_OPTION}
    When Wait And Click  ${DISTRICT_XINYI_OPTION}
    When Input Text  ${LOAN_AMOUNT}  4
    When Wait And Click  ${LOAN_TERM_30Y_INPUT}
    When Input Text  ${INTEREST_RATE}  2.18
    When Wait And Click  ${CALC_BUTTON}
    Then Element Text Should Be  ${MAX_LOAN}  7.5～8成
    Then Element Text Should Be  ${HOUSE_PRICE}  1,320萬
    Then Element Text Should Be  ${SELF_PREPARE}  264萬
    Then Element Text Should Be  ${BORROW_MAX}  1,056萬

Reset Loan Calculation Success
    Given Go To Url  ${LOAN_PAGE}
    When Wait And Click  ${CITY_TAIPEI_OPTION}
    When Wait And Click  ${DISTRICT_XINYI_OPTION}
    When Input Text  ${LOAN_AMOUNT}  4
    When Wait And Click  ${LOAN_TERM_30Y_INPUT}
    When Input Text  ${INTEREST_RATE}  2.18
    When Wait And Click  ${RESET_BUTTON}
    Then Element Class Attribute Should Match Regexp  ${CITY_DEFAULT_TEXT}  ${CLASS_SELECTED}
    Then Element Class Attribute Should Match Regexp  ${DISTRICT_DEFAULT_TEXT}  ${CLASS_SELECTED}
    Then Element Text Should Be  ${LOAN_AMOUNT}  ${EMPTY}
    Then Element Class Attribute Should Match Regexp  ${LOAN_TERM_20Y}  ${FLEX_3_ACTIVE}
    Then Element Attribute Should Match  ${LOAN_TERM_30Y}  class  ${FLEX_3_INACTIVE}
    Then Element Attribute Should Match  ${LOAN_TERM_Other}  class  ${FLEX_3_INACTIVE}
    Then Element Text Should Be  ${INTEREST_RATE}  ${EMPTY}

The Required Fields Have Not Been Filled In
    Given Go To Url  ${LOAN_PAGE}
    When Wait And Click  ${CALC_BUTTON}
    Then Element Attribute Should Match  ${CITY_WARN_TEXT}  style  ${DISPLAY_BLOCK}
    Then Element Attribute Should Match  ${DISTRICT_WARN_TEXT}  style  ${DISPLAY_BLOCK}
    Then Element Class Attribute Should Match Regexp  ${LOAN_AMOUNT_WARN_TEXT}  ${CLASS_IS_ERROR}
    Then Element Class Attribute Should Match Regexp  ${INTEREST_RATE_WARN_TEXT}  ${CLASS_IS_ERROR}

Input The Illegal String In Loan Amount Field
    Given Go To Url  ${LOAN_PAGE}
    When Input Text  ${LOAN_AMOUNT}  abc
    When Wait And Click  ${CALC_BUTTON}
    Then Element Class Attribute Should Match Regexp  ${LOAN_AMOUNT_WARN_TEXT}  ${CLASS_IS_ERROR}

Input The Illegal String In interest Rate Field
    Given Go To Url  ${LOAN_PAGE}
    When Input Text  ${INTEREST_RATE}  abc
    When Wait And Click  ${CALC_BUTTON}
    Then Element Class Attribute Should Match Regexp  ${INTEREST_RATE_WARN_TEXT}  ${CLASS_IS_ERROR}
