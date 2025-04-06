*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn
Library    String
Library    JSONLibrary


*** Variables ***

# MULTIPLE VARIABLES (BEGINNING)

### Computer desktopj93k2ev for tests at home
### Computer demo1911 is used for the automated tests of Telemis-Audit
### Computer demo7358 is used for the tests of API REST, probably I use only the computer demo1911 for both tests

${MyHostname}    desktopj93k2ev
# ${MyHostname}    demo1911
# ${MyHostname}    demo7358

### ID of the scheduled task for testing Telemis-Audit
### Computer desktopj93k2ev for tests at home
### Computer demo1911 for the automated tests of Telemis-Audit
### Computer demo9109 for tests with the virtual machine

${MyScheduledTaskID01}    vZYCPTDhMwuOpzg1
# ${MyScheduledTaskID01}    8qEdvUX6DwNiWpMg
# ${MyScheduledTaskID01}    lCdsS8mQ7XxmyHxE

### docId for testing Telemis-Repository
### Computer desktopj93k2ev for tests at home
### Computer demo1911 for the automated tests of Telemis-Audit
### Computer demo9109 for tests with the virtual machine

${MyPatient1DocId}    A2.sim.a192.be.simon.P1.8.1
# ${MyPatient1DocId}    A2.sim.d2b8.be.simon.P1.1
# ${MyPatient1DocId}    A2.sim.cf61.be.simon.P1.0


# MULTIPLE VARIABLES (END)

${MyRepositoryName}    AUDITTC178
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master

${MyFolderWorkspace}    C:/000/jenkins/workspace
# NOT REQUIRED ANYMORE ${MyFolderResults}    results
${MyLogFile}    MyLogFile.log
${MyFolderCertificate}    security

${MyTmpPortNbr}    2310

${SiteName}    simon.be
${MyPortNumber}    10000
#  Do not use the brackets to define the variable of bearer token
${bearerToken}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbnN0YWxsZXIiLCJuYW1lIjoiSW5zdGFsbGVyIiwiaXNzIjoiVGVsZW1pcyIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxODYxOTIwMDAwfQ.pynnZ69Qx50wuz0Gh4lx-FHZznrcQkbMm0o-PLhb3S0

${MyBrowser1}    chrome
${MyBrowser2}    firefox
${MyBrowser3}    edge

${SiteManagerUser1Login}     local_admin
${SiteManagerUser1Password}    KEYCLOAKTastouk!

${SiteManagerUser2Login}     alphonse
${SiteManagerUser2Password}    alphonse

${MyEntity01Name}    audit
${MyEntity01Port}    9940
${MyEntity01VersionNbr}    4.2.0
${MyEntity01APIVersion}    1.0.0
${MyEntity01EntityId}    simon.be:audit:audit

${MyEntity02Name}    dicomgate
${MyEntity02Port}    9920
${MyEntity02VersionNbr}    4.2.0
${MyEntity02APIVersion}    1.0.0
${MyEntity02EntityId}    simon.be:dicomgate:dicomgate

${MyEntity03Name}    hl7gate
${MyEntity03Port}    9930
${MyEntity03VersionNbr}    3.2.0
${MyEntity03APIVersion}    1.0.0
${MyEntity03EntityId}    simon.be:hl7gate:hl7gate

${MyEntity04Name}    patient
${MyEntity04Port}    9990
${MyEntity04VersionNbr}    3.2.0
${MyEntity04APIVersion}    1.0.0
${MyEntity04EntityId}    simon.be:patient:patient

${MyEntity05Name}    registry
${MyEntity05Port}    9960
${MyEntity05VersionNbr}    4.2.0
${MyEntity05APIVersion}    1.0.0
${MyEntity05EntityId}    simon.be:registry:registry

${MyEntity06Name}    repository
${MyEntity06Port}    9970
${MyEntity06VersionNbr}    4.2.0
${MyEntity06APIVersion}    1.0.0
${MyEntity06EntityId}    simon.be:repository:repository

${MyEntity07Name}    user
${MyEntity07Port}    9950
${MyEntity07VersionNbr}    4.2.0
${MyEntity07APIVersion}    1.0.0
${MyEntity07EntityId}    simon.be:user:user

${MyEntity08Name}    worklist
${MyEntity08Port}    9980
${MyEntity08VersionNbr}    3.2.0
${MyEntity08APIVersion}    1.0.0
${MyEntity08EntityId}    simon.be:worklist:worklist

${MyEntity09Name}    sitemanager
${MyEntity09Port}    10000
${MyEntity09VersionNbr}    4.2.0
${MyEntity09APIVersion}    1.0.0
${MyEntity09EntityId}    simon.be:sitemanager:sitemanager

# API command for API version of Site Manager https://HOSTNAME:10000/site/api/admin/api-version
# ${VersionWatchdog}    4.1.0-3491    # Not required anymore from version 1.2.0 of TFP because Site Manager and Watchdog have been merged into only one application

${MyXmlFile01}    20250330-013349.0521.xml

${MyMappingName01}    TESTORMO01
${MyMappingName02}    MYTEST95
${MyHL7Port01}    2599
${MyHL7Port02}    2597

${JsonFileHL7Gate01}    ris2597.json
${JsonFileHL7Gate02}    mapping95.json

${JsonFilePatient01}    patient970532create.json
${JsonFilePatient02}    patient970532delete.json

${MyPatient1FamilyName}    AZ128571
${MyPatient1FirstName}    ALBERT
${MyPatient1SeriesDescription}    CTOP128571
${MyPatient1BirthdateYYYY}    1945
${MyPatient1BirthdateMM}    11
${MyPatient1BirthdateDD}    24
${MyPatient1AccessionNumber}    CTEF128571
${MyPatient1PatientID}    CTAB128571
${MyPatient1StudyDescription}    CTMN128571
${MyPatient1StudyDate}    27/03/2025
${MyPatient1SOPIUID}    1.2.276.0.7230010.3.1.4.4197639315.23468.1743042029.839
${MyPatient1StudyIUID}    1.2.276.0.7230010.3.1.2.4197639315.23468.1743042029.838
${MyPatient1SeriesIUID}    1.2.276.0.7230010.3.1.3.4197639315.23468.1743042029.837
${MyPatient1StudyType}    CTST128571
${MyPatient1SeriesDescription}    CTOP128571

${MyPublicLabel01}    EMERGENCY



*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
    # Delete the previous screenshots
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/*.png
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}
    # ${Time} =    Get Current Date
    # Create file  ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Start the tests \n


Check That Watchdog Is Running
    [Documentation]    Check that Watchdog is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Watchdog
    [Documentation]    Check the version number of Watchdog
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Watchdog ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s
    # Should Contain    ${response.text}    ${VersionSiteManager}


Check That Site Manager Is Running
    [Documentation]    Check that Site Manager is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Site Manager
    [Documentation]    Check the version number of Site Manager
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Site Manager ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    sitemanager
    Sleep    1s


Check That Telemis Entity Is Running
    [Documentation]    Check that Telemis Entity is running
    [Arguments]    ${MyEntityPort}
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request.
    ${response} =    GET On Session    mysession    /ping
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response}
    Log    ${response.text}
    Log    ${response.status_code}
    Log    ${response.content}
    # Keyword Log To Console of BuiltIn shows the message in the console
    Log To Console    ${response.status_code}
    # Keyword Should Be Equal As Strings of BuildIn
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong


Check Version Of Telemis Entity
    [Documentation]    Check the version number of entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MyEntityVersionNbr}
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /version
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of ${MyEntityName}${SPACE}${response.text} \n
    # Keyword Should Be Equal As Strings of BuildIn
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityVersionNbr}


Identify And Check Name Of Telemis Entity
    [Documentation]    Identify and check the name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /identity
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}


Identify And Check SiteName Of Telemis Entity
    [Documentation]    Retrieve and check the site name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MySiteName}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    # Retrieve the second line of the text
    ${MyRetrievedLine} =    Get Line    ${response.text}    1
    # In some cases you have to convert the retrieved value with the keyword Convert To String of BuiltIn
    Log    ${MyRetrievedLine}
    ${MySplittedLine} =    Split String    ${MyRetrievedLine}    "
    Log    ${MySplittedLine}
    # Retrieve the field name (sitename)
    ${MyString1} =    Get Substring    ${MySplittedLine}    1    2
    Log    ${MyString1}
    Should Contain    ${MyString1}    siteName
    # Retrieve the value of the field
    ${MyString2} =    Get Substring    ${MySplittedLine}    3    4
    Log    ${MyString2}
    Should Contain    ${MyString2}    ${MySiteName}


Identify And Check SiteName Of Telemis EntityV2
    [Documentation]    Retrieve and check the site name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MySiteName}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${endpoint} =    Set Variable    /api/admin/identity
    ${response} =    GET On Session    mysession    ${endpoint}
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    Log    ${response.headers}
    #  The attribute json does NOT work, you get no response, you must replace json first with content, and then you convert the response into a string
    # Log    ${response.json}
    Log    ${response.content}
    # Keyword Convert String To Json of JSONLibrary
    ${json_response} =    Convert String To Json    ${response.content}
    # Keyword Get Value From Json of JSONLibrary
    ${MyValue} =    Get Value From Json    ${json_response}    $.siteName
    ${MyValue} =    Convert To String    ${MyValue}
    ${MyValue} =    Remove String Using Regexp    ${MyValue}    ['\\[\\],]
    Log    ${MyValue}
    Should Be Equal    ${MyValue}    ${MySiteName}
    # Keyword Get From Dictionary of Collections, verify the data type of the response
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    application/json


Identify And Check API version Of Telemis Entity
    [Documentation]    Retrieve and check the version number of API for the application
    [Arguments]    ${MyEntityPort}    ${MyEntityApiVersion}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${endpoint} =    Set Variable    /api/admin/api-version
    ${response} =    GET On Session    mysession    ${endpoint}
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    ${apiversion} =    Convert to String    ${response.content}
    Log    ${apiversion}
    Should Be Equal    ${apiversion}    ${MyEntityApiVersion}
    # For this test, you can also replace response.content with response.text, it is easier because the format of the response is a text
    Log    ${response.headers}
    # Keyword Get From Dictionary of Collections, verify the data type of the response, this check is not mandatory for the test
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    text/plain;charset=UTF-8


Send My Event To Telemis Audit
    [Documentation]    Send the event to Telemis-Audit
    [Arguments]    ${MyXmlFile}
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/xml
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/xml/${MyXmlFile}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/audit
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200


Take My Screenshot
    ${MyCurrentDateTime} =    Get Current Date    result_format=%Y%m%d%H%M%S
    Log    ${MyCurrentDateTime}
    # Keyword of SeleniumLibrary, you do not need to use the library Screenshot
    Capture Page Screenshot    selenium-screenshot-${MyCurrentDateTime}.png
    Sleep    2s


My User Opens Internet Browser And Connects To Site Manager
    [Documentation]    The user opens Internet browser and then connects to the website of Site Manager
    [Arguments]    ${MyUserLogin}    ${MyUserPassword}
    Open Browser    https://${MyHostname}:10000/site    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Wait Until Page Contains    Login to your account    timeout=15s
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=15s
    Wait Until Element Is Visible    id=password    timeout=15s
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Input Text    id=username    ${MyUserLogin}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=username    ${MyUserLogin}
    Input Text    id=password    ${MyUserPassword}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=password    ${MyUserPassword}
    Click Button    id=kc-login
    Wait Until Page Contains    Site Manager    timeout=15s
    Wait Until Element Is Visible    link=Sign out    timeout=15s
    Sleep    3s


Log Out My User Session Of Site Manager
    Wait Until Page Contains    Site Manager    timeout=15s
    Wait Until Element Is Visible    link=Sign out    timeout=15s
    Click Link    link=Sign out
    Wait Until Element Is Visible    id=kc-logout    timeout=15s
    Element Should Be Visible    id=kc-logout
    Click Button    id=kc-logout
    Wait Until Page Contains    Login to your account    timeout=15s
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Sleep    2s


Check My Predefined Search With Two Input Boxes
    [Documentation]    Test and check the predefined search of the tab Presets, only applicable with two input boxes
    [Arguments]    ${MyPresetName}    ${MyInputBox1}    ${MyInputBox2}    ${MyInputBoxValue1}    ${MyInputBoxValue2}    ${MyButtonClear}    ${MyButtonSearch}
    Wait Until Page Contains    ${MyPresetName}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox1}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox2}    timeout=15s
    Input Text    ${MyInputBox1}    ${MyInputBoxValue1}    clear=True
    Input Text    ${MyInputBox2}    ${MyInputBoxValue2}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox1}    ${MyInputBoxValue1}
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox2}    ${MyInputBoxValue2}
    Take My Screenshot
    Wait Until Element Is Visible    ${MyButtonClear}    timeout=15s
    Wait Until Element Is Visible    ${MyButtonSearch}    timeout=15s
    Click Element    ${MyButtonClear}
    Wait Until Keyword Succeeds    15s    3s    Element Text Should Be    ${MyInputBox1}    ${EMPTY}
    ${MyValue} =    Get Text    ${MyInputBox1}
    Log    ${MyValue}


Check My Predefined Search With Only One Input Box
    [Documentation]    Test and check the predefined search of the tab Presets, applicable with only one input box
    [Arguments]    ${MyPresetName}    ${MyInputBox1}    ${MyInputBoxValue1}    ${MyButtonClear}    ${MyButtonSearch}
    Wait Until Page Contains    ${MyPresetName}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox1}    timeout=15s
    Input Text    ${MyInputBox1}    ${MyInputBoxValue1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox1}    ${MyInputBoxValue1}
    Take My Screenshot
    Wait Until Element Is Visible    ${MyButtonClear}    timeout=15s
    Wait Until Element Is Visible    ${MyButtonSearch}    timeout=15s
    Click Element    ${MyButtonClear}
    Wait Until Keyword Succeeds    15s    3s    Element Text Should Be    ${MyInputBox1}    ${EMPTY}
    ${MyValue} =    Get Text    ${MyInputBox1}
    Log    ${MyValue}


Fill My Input Box Of Search Criterion In Tab Search
    [Documentation]    Fill the input box of search criterion located in the tab Search
    [Arguments]    ${MySearchCriterion}    ${MySearchCriterionValue}
    Wait Until Element Is Visible    ${MySearchCriterion}    timeout=15s
    Element Should Be Visible    ${MySearchCriterion}
    Input Text    ${MySearchCriterion}    ${MySearchCriterionValue}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MySearchCriterion}    ${MySearchCriterionValue}


Check And Test My Event Name
    [Documentation]    Test and check the event name with the tab Presets
    [Arguments]    ${MyEventName}
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Element Should Be Visible    link=Presets
    Click Link    link=Presets
    Wait Until Page Contains    All audit events related to its type    timeout=15s
    Wait Until Element Is Visible    ${Preset01z01}    timeout=15s
    Element Should Be Visible    ${Preset01z01}
    # Select one item from the combo box
    Click Element    ${Preset01z01}
    Wait Until Element Is Visible    xpath=//span[contains(.,'${MyEventName}')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,'${MyEventName}')]
    Click Element    xpath=//span[contains(.,'${MyEventName}')]
    Wait Until Element Contains    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Element Should Contain    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}
    # Check the button Search
    Wait Until Element Is Visible    ${Preset01S}    timeout=15s
    Element Should Be Visible    ${Preset01S}
    Click Element    ${Preset01S}
    Sleep    2s
    Wait Until Page Contains    Timestamp    timeout=15s
    Wait Until Page Contains    Event    timeout=15s
    Wait Until Page Contains    ${MyEventName}    timeout=15s
    Take My Screenshot
    Sleep    1s




*** Test Cases ***

TEST01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

TEST02
    [Documentation]    Check that the service Telemis-Audit is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity01Port}

TEST03
    [Documentation]    Identify and check the version number of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}    ${MyEntity01VersionNbr}

TEST04
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Audit)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}

TEST05
    [Documentation]    Identify and check the site name of Telemis-Audit
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity01Port}    ${MyEntity01Name}    ${SiteName}

TEST06
    [Documentation]    Retrieve and check the detailed informations of Telemis-Audit, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity01EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    audit

TEST07
    [Documentation]    Check and modify the configuration of Telemis-Audit, for example (properties of Central Config): cronDefinition, maxMinutesExecTime, retentionDays, batchSize, performArchive, archiveDir, simulationMode, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/cfg/retention
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    # Keyword Convert String To Json of JSONLibrary
    ${json_response} =    Convert String To Json    ${response.content}
    # Keyword Get Value From Json of JSONLibrary, if there are multiple identical elements "label" in JSON file, please use "[0]." to get the value from the first element "label"
    ${MyValue} =    Get Value From Json    ${json_response}    $.retentionDays
    ${MyValue} =    Convert To String    ${MyValue}
    ${MyValue} =    Remove String Using Regexp    ${MyValue}    ['\\[\\],]
    Log    ${MyValue}
    Should Be Equal    ${MyValue}    365
    Log    ${response.headers}
    Log    ${response.text}
    Should Contain    ${response.text}    0 0 4
    Should Contain    ${response.text}    3600
    Should Contain    ${response.text}    365
    Should Contain    ${response.text}    100
    Should Contain    ${response.text}    false
    Should Contain    ${response.text}    archive


