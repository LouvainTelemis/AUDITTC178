*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn

*** Variables ***

${MyHostname}    demo1234

*** Keywords ***

Remove The Previous Results
    Remove Files    C:/temp/result.log

*** Test Cases ***

Test01
    [Documentation]    Test with Firefox
    [Tags]    CRITICALITY LOW
    Open Browser    https://www.telemis.com/    Firefox
    Wait Until Page Contains    Extending Human Life    timeout=15s
    Maximize Browser Window
    Sleep    5s
    Close All Browsers

Test02
    [Documentation]    Test with Edge
    [Tags]    CRITICALITY LOW
    Open Browser    https://www.telemis.com/    Edge
    Wait Until Page Contains    Extending Human Life    timeout=15s
    Maximize Browser Window
    Sleep    5s
    Close All Browsers

Test03
    [Documentation]    Test with Chrome
    [Tags]    CRITICALITY LOW
    Open Browser    https://www.telemis.com/    Chrome
    Wait Until Page Contains    Extending Human Life    timeout=15s
    Maximize Browser Window
    Sleep    5s
    Close All Browsers