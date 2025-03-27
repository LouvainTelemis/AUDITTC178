*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn


*** Variables ***

# ${MyHostname}    desktopj93k2ev
${MyHostname}    demo1911
${MyRepositoryName}    AUDITTC178
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master
${MyFolderWorkspace}    C:/000/jenkins/workspace

${MyDirectoryDownload}    C:\\temp\\zDownload
${base_url_smtp_server}    http://localhost:8070

${MyDicomPath}    C:/VER498TMP1/telemis/dicom
${DirTmUploaderData}    D:/telemis/externalBundles
${DirTmUploaderMetadata}    D:/telemis/dicom/bundles

${MyText01}    àâäèéêëîïôùûüÿç ÄäÖöÜüß @+-_

${MyPatient1FamilyName}    AZ127511
${MyPatient1FirstName}    ALBERT
${MyPatient1SeriesDescription}    CTOP127511
${MyPatient1BirthdateYYYY}    1945
${MyPatient1BirthdateMM}    11
${MyPatient1BirthdateDD}    24
${MyPatient1AccessionNumber}    CTEF127511
${MyPatient1PatientID}    CTAB127511
${MyPatient1StudyDescription}    CTMN127511
${MyPatient1StudyDate}    24/03/2025

${MyPatient2FamilyName}    AZ583197
${MyPatient2FirstName}    FABRICE
${MyPatient2SeriesDescription}    CTOP583197
${MyPatient2BirthdateYYYY}    1953
${MyPatient2BirthdateMM}    12
${MyPatient2BirthdateDD}    15
${MyPatient2AccessionNumber}    CTEF583197
${MyPatient2PatientID}    CTAB583197
${MyPatient2StudyDescription}    CTMN583197
${MyPatient2StudyDate}    19/03/2024

${MyPatient3FamilyName}    AZ694218
${MyPatient3FirstName}    HECTOR
${MyPatient3SeriesDescription}    CTOP694218
${MyPatient3BirthdateYYYY}    1964
${MyPatient3BirthdateMM}    10
${MyPatient3BirthdateDD}    16
${MyPatient3AccessionNumber}    CTEF694218
${MyPatient3PatientID}    CTAB694218
${MyPatient3StudyDescription}    CTMN694218
${MyPatient3StudyDate}    19/03/2024

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

${TmpWebAdministratorLogin}    telemis_webadmin
${TmpWebAdministratorPassword}    KEYCLOAKTastouk!

${TmpWebUser1Login}    anthony
${TmpWebUser1Password}    Videogames2024
${TmpWebUser1Email}    anthony@hospital8.com

${TmpWebUser2Login}    albert
${TmpWebUser2Password}    Videogames2024
${TmpWebUser2Email}    albert@hospital8.com

${TmUploaderUser1Login}    gabriel
${TmUploaderUser1Password}    Videogames2024

# NOT USEFUL ${MyFolderResults}    results
${MyLogFile}    MyLogFile.log
${MyFolderCertificate}    security

${MyEntityName1}    audit
${MyEntityPort1}    9940
${MyEntityName2}    dicomgate
${MyEntityPort2}    9920
${MyEntityName3}    hl7gate
${MyEntityPort3}    9930
${MyEntityName4}    patient
${MyEntityPort4}    9990
${MyEntityName5}    registry
${MyEntityPort5}    9960
${MyEntityName6}    repository
${MyEntityPort6}    9970
${MyEntityName7}    user
${MyEntityPort7}    9950
${MyEntityName8}    worklist
${MyEntityPort8}    9980

${VersionSiteManager}    4.1.2-228
# ${VersionWatchdog}    4.1.0-3491    # Not required anymore from version 1.2.0 of TFP because Site Manager and Watchdog have been merged into only one application

${MySource1}    telemis
${MyDestination1}    TMP1.simon.be
${MyDocId1}    A2.sim.c88d.be.simon.P1.1

${MyDateFrom1}    01/01/2025
${MyDateTo1}    02/23/2025


*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    # Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
    # Delete the previous screenshots
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/*.png
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}
    # ${Time} =    Get Current Date
    # Create file  ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Start the tests \n
    # Remove DICOM files from dicomPath of TMAA
    Remove Files    ${MyDicomPath}/*.*
    Create Directory    ${DirTmUploaderData}
    Create Directory    ${DirTmUploaderMetadata}
    Remove Files    ${DirTmUploaderData}/*
    Remove Files    ${DirTmUploaderMetadata}/*


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
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Telemis Entity
    [Documentation]    Check the version number of entity
    [Arguments]    ${MyEntityName}    ${MyEntityPort}
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-${MyEntityName}${SPACE}${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    Sleep    1s


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


My User Opens Internet Browser And Connects To My TMP Web
    [Documentation]    The user opens Internet browser and then connects to the website of TMP Web
    [Arguments]    ${MyUserLogin}    ${MyUserPassword}
    Open Browser    https://${MyHostname}.telemiscloud.com/tmpweb/patients.app    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Wait Until Page Contains    TM-Publisher web    timeout=15s
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=15s
    Wait Until Element Is Visible    id=password    timeout=15s
    Input Text    id=username    ${MyUserLogin}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=username    ${MyUserLogin}
    Input Text    id=password    ${MyUserPassword}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=password    ${MyUserPassword}
    Click Button    id=kc-login
    Wait Until Page Contains    Telemis Media Publisher Web    timeout=15s
    Sleep    3s


Log Out My User Session Of TMP Web
    Click Link    link=Logout
    Wait Until Element Is Visible    xpath=//*[@id="doctor-button"]    timeout=15s
    Sleep    2s


Delete All My Email Messages In SMTP Server
    [Documentation]    Delete all the email messages in SMTP server
    Create Session    AppAccess    ${base_url_smtp_server}
    ${response} =    Delete On Session    AppAccess    /api/emails
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    2s


Log Out My User Session Of TM-Uploader
    Wait Until Element Is Visible    id=logoutLabelLayout    timeout=15s
    Click Element    id=logoutLabelLayout
    Wait Until Page Contains    Are you sure you want to logout ?    timeout=15s
    Wait Until Element Is Visible    id=rightButton    timeout=15s
    Click Element    id=rightButton
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Sleep    1s



*** Test Cases ***

Test01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

Test02
    [Documentation]    Check that Site Manager is running
    [Tags]    CRITICALITY NORMAL
    Check That Site Manager Is Running

Test03
    [Documentation]    Check the version number of Site Manager
    [Tags]    CRITICALITY NORMAL
    Check Version Of Site Manager

Test04
    [Documentation]    Check that Audit is running, and then check the version number of the application
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntityPort1}
    Check Version Of Telemis Entity    ${MyEntityName1}    ${MyEntityPort1}

Test05
    [Documentation]    User enters the login and password to access Site Manager
    [Tags]    CRITICALITY HIGH
    My User Opens Internet Browser And Connects To Site Manager    ${SiteManagerUser1Login}    ${SiteManagerUser1Password}
    Take My Screenshot

Test06
    [Documentation]    User selects and opens the interface of Audit
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Audit    timeout=15s
    Element Should Be Visible    link=Audit
    Click Link    link=Audit
    Sleep    3s
    # Select the iframe of Audit
    # The locator of the iframe is NOT "class=ng-star-inserted", I tested it and it does NOT work.
    Wait Until Element Is Visible    xpath=/html/body/app-root/div/div[2]/app-external-page/iframe    timeout=15s
    Frame Should Contain    xpath=/html/body/app-root/div/div[2]/app-external-page/iframe    Predefined search
    Select Frame    xpath=/html/body/app-root/div/div[2]/app-external-page/iframe
    Wait Until Page Contains    Predefined search    timeout=15s
    Current Frame Should Contain    Predefined search
    # Check that the first tab Presets is selected by default, and not the second tab Search (the text Timestamp exists only in the second tab)
    Current Frame Should Not Contain    Timestamp
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Wait Until Element Is Visible    link=Search    timeout=15s
    Element Should Be Visible    link=Presets
    Element Should Be Visible    link=Search
    # The line below is only for tests
    # Unselect Frame

Test 07
    [Documentation]    Test the tab Search
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Search    timeout=15s
    Element Should Be Visible    link=Search
    Click Link    link=Search
    # Check 12 search criteria
    Wait Until Element Is Visible    name=outcome    timeout=15s
    Wait Until Element Is Visible    name=from    timeout=15s
    Wait Until Element Is Visible    name=to    timeout=15s
    Wait Until Element Is Visible    name=action    timeout=15s
    Wait Until Element Is Visible    name=eventType    timeout=15s
    Wait Until Element Is Visible    name=user    timeout=15s
    Wait Until Element Is Visible    name=source    timeout=15s
    Wait Until Element Is Visible    name=destination    timeout=15s
    Wait Until Element Is Visible    name=patientId    timeout=15s
    Wait Until Element Is Visible    name=patientName    timeout=15s
    Wait Until Element Is Visible    name=accessionNumber    timeout=15s
    Wait Until Element Is Visible    name=documentId    timeout=15s
    # Check 7 columns of the table
    Wait Until Page Contains    Outcome    timeout=15s
    Wait Until Page Contains    Timestamp    timeout=15s
    Wait Until Page Contains    Event    timeout=15s
    Wait Until Page Contains    User    timeout=15s
    Wait Until Page Contains    Source    timeout=15s
    Wait Until Page Contains    Destination    timeout=15s
    Wait Until Page Contains    Patient    timeout=15s
    Wait Until Page Contains    Accession Number    timeout=15s
    # Fill the search criteria
    # Select one item from the combo box Outcome
    Element Should Be Visible    name=outcome
    Click Element    name=outcome
    Wait Until Element Is Visible    xpath=//span[contains(.,' SUCCESS')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' FAILURE')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,' SUCCESS')]
    Click Element    xpath=//span[contains(.,' SUCCESS')]
    # The 3 lines mentioned below do not work with the keyword Get Value of BuiltIn
    # ${MyValue} =    Get Value    name=outcome
    # Log    ${MyValue}
    # Should Contain    ${MyValue}    SUCCESS
    Wait Until Element Contains    name=outcome    SUCCESS    timeout=15s

    # Search criterion From
    Input Text    name=from    ${MyDateFrom1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=from    ${MyDateFrom1}
    # Search criterion To
    Input Text    name=to    ${MyDateTo1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=to    ${MyDateTo1}

    # Select one item from the combo box Action
    Element Should Be Visible    name=action
    Click Element    name=action
    Wait Until Element Is Visible    xpath=//span[contains(.,' CREATE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' READ')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' UPDATE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' DELETE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' EXECUTE')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,' EXECUTE')]
    Click Element    xpath=//span[contains(.,' EXECUTE')]
    Wait Until Element Contains    name=action    EXECUTE    timeout=15s

    # Select one item from the combo box Event
    Element Should Be Visible    name=eventType
    Click Element    name=eventType
    Wait Until Element Is Visible    xpath=//span[contains(.,'DOC_ACCESS')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'DOC_FORWARD')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'DOC_START_TRANSFER')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'DOC_STORE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'DOC_TRANSFER')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'FILMER')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'LABEL_MGT')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'MEASURES_MGT')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,'USER_LOGIN')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,'FILMER')]
    Click Element    xpath=//span[contains(.,'FILMER')]
    Sleep    1s
    # The check fails with the keyword Wait Until Element Contains, see example below, you must check with the keyword Get Value
    # Wait Until Element Contains    name=eventType    FILMER    timeout=15s
    ${MyValue} =    Get Value    name=eventType
    Log    ${MyValue}
    Should Contain    ${MyValue}    FILMER

    # Search criterion User
    Input Text    name=user    ${SiteManagerUser2Login}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=user    ${SiteManagerUser2Login}
    # Search criterion Source
    Input Text    name=source    ${MySource1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=source    ${MySource1}
    # Search criterion Destination
    Input Text    name=destination    ${MyDestination1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=destination    ${MyDestination1}
    # Search criterion Patient ID
    Input Text    name=patientId    ${MyPatient1PatientID}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=patientId    ${MyPatient1PatientID}
    # Search criterion Patient name
    Input Text    name=patientName    ${MyPatient1FamilyName}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=patientName    ${MyPatient1FamilyName}
    # Search criterion Accession Number
    Input Text    name=accessionNumber    ${MyPatient1AccessionNumber}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=accessionNumber    ${MyPatient1AccessionNumber}
    # Search criterion Document ID
    Input Text    name=documentId    ${MyDocId1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    name=documentId    ${MyDocId1}
    Sleep    1s
    Take My Screenshot
    # Empty all the fields
    Wait Until Element Is Visible    xpath=//button[contains(.,'Clear')]    timeout=15s
    Click Button    xpath=//button[contains(.,'Clear')]
    Wait Until Element Contains    name=patientName    ${EMPTY}    timeout=15s
    Textfield Value Should Be    name=patientName    ${EMPTY}
    Take My Screenshot
    Unselect Frame

Test90
    [Documentation]    User exits Site Manager
    [Tags]    CRITICALITY NORMAL
    # Before logging out the user session, check that the iframe has been deselected
    Log Out My User Session Of Site Manager
    Close All Browsers
