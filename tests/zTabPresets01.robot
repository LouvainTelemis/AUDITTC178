*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn


*** Variables ***

${MyHostname}    desktopj93k2ev
# ${MyHostname}    demo1911
${MyRepositoryName}    AUDITTC178
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master
${MyFolderWorkspace}    C:/000/jenkins/workspace

${MyDirectoryDownload}    C:\\temp\\zDownload
${base_url_smtp_server}    http://localhost:8070

${MyDicomPath}    C:/VER498TMP1/telemis/dicom
${DirTmUploaderData}    D:/telemis/externalBundles
${DirTmUploaderMetadata}    D:/telemis/dicom/bundles

${MyText01}    àâäèéêëîïôùûüÿç ÄäÖöÜüß @+-_

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

${MyPatient2FamilyName}    AZ128572
${MyPatient2FirstName}    ALBERT
${MyPatient2SeriesDescription}    CTOP128572
${MyPatient2BirthdateYYYY}    1945
${MyPatient2BirthdateMM}    11
${MyPatient2BirthdateDD}    24
${MyPatient2AccessionNumber}    CTEF128572
${MyPatient2PatientID}    CTAB128572
${MyPatient2StudyDescription}    CTMN128572
${MyPatient2StudyDate}    27/03/2025

${MyPatient3FamilyName}    AZ128573
${MyPatient3FirstName}    ALBERT
${MyPatient3SeriesDescription}    CTOP128573
${MyPatient3BirthdateYYYY}    1945
${MyPatient3BirthdateMM}    11
${MyPatient3BirthdateDD}    24
${MyPatient3AccessionNumber}    CTEF128573
${MyPatient3PatientID}    CTAB128573
${MyPatient3StudyDescription}    CTMN128573
${MyPatient3StudyDate}    27/03/2025

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

# NOT REQUIRED ANYMORE ${MyFolderResults}    results
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

${VersionSiteManager}    4.2.0-SNAPSHOT-2384-BETA
# ${VersionWatchdog}    4.1.0-3491    # Not required anymore from version 1.2.0 of TFP because Site Manager and Watchdog have been merged into only one application

${MySource1}    telemis
${MyDestination1}    TMP1.simon.be
${MyDocId1}    A2.sim.c88d.be.simon.P1.1

${MyDateFrom1}    01/01/2025
${MyDateTo1}    02/23/2025

# xpath of input boxes located in the tab Presets (Predefined search)

${Preset01z01}    xpath=//span[contains(.,'Type')]

${Preset02z01}    xpath=//div/div/input
${Preset02z02}    xpath=//div[2]/mat-form-field/div/div/div/input

${Preset03z01}    xpath=//fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset03z02}    xpath=//fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset04z01}    xpath=//div[3]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset04z02}    xpath=//div[3]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

${Preset05z01}    xpath=//div[4]/div/fieldset/form/div/div/mat-form-field/div/div/div/input

${Preset06z01}    xpath=//div[4]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset06z02}    xpath=//div[4]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset07z01}    xpath=//div[5]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset07z02}    xpath=//div[5]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

${Preset08z01}    xpath=//div[5]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset08z02}    xpath=//div[5]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset09z01}    xpath=//div[5]/div/fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset09z02}    xpath=//div[5]/div/fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset10z01}    xpath=//div[6]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset10z02}    xpath=//div[6]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

${Preset11z01}    xpath=//div[6]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset11z02}    xpath=//div[6]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset12z01}    xpath=//div[6]/div/fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset12z02}    xpath=//div[6]/div/fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

${Preset13z01}    xpath=//fieldset[4]/form/div/div/mat-form-field/div/div/div/input



*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
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
    [Documentation]    User enters the login and password to access Site Manager
    [Tags]    CRITICALITY HIGH
    My User Opens Internet Browser And Connects To Site Manager    ${SiteManagerUser1Login}    ${SiteManagerUser1Password}
    Take My Screenshot

Test02
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

Test 03
    [Documentation]    Check that 13 presets exists in the tab or page of Predefined search
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Element Should Be Visible    link=Presets
    Click Link    link=Presets
    # Check 13 presets
    Wait Until Page Contains    All audit events related to its type    timeout=15s
    Wait Until Page Contains    Who made a Dicom Query    timeout=15s
    Wait Until Page Contains    Who made a Dicom Send    timeout=15s
    Wait Until Page Contains    Who removed a label    timeout=15s
    Wait Until Page Contains    All events related to an audit source    timeout=15s
    Wait Until Page Contains    All events that happened between dates    timeout=15s
    Wait Until Page Contains    All events related to a patient    timeout=15s
    Wait Until Page Contains    Who accessed a patient    timeout=15s
    Wait Until Page Contains    Who modified a patient    timeout=15s
    Wait Until Page Contains    All events related to a document    timeout=15s
    Wait Until Page Contains    Who accessed a document    timeout=15s
    Wait Until Page Contains    Who deleted a document    timeout=15s
    Wait Until Page Contains    Who modified a study    timeout=15s

Test 04
    [Documentation]    Check and test the preset #01 (All audit events related to its type)
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    xpath=//span[contains(.,'Type')]    timeout=15s
    Click Element    xpath=//span[contains(.,'Type')]
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
    Wait Until Element Contains    xpath=//span[contains(.,'FILMER')]    FILMER    timeout=15s
    # You can also make the check with the keyword Get Text, the check fails with the keyword Get Value, you must use Get Text instead of Get Value
    ${MyValue} =    Get Text    xpath=//span[contains(.,'FILMER')]
    Log    ${MyValue}
    Should Contain    ${MyValue}    FILMER
    # It is the third solution to make the check
    Wait Until Keyword Succeeds    15s    3s    Element Should Contain    xpath=//span[contains(.,'FILMER')]    FILMER
    # Check the buttons Clear and Search
    Wait Until Element Is Visible    xpath=//button[contains(.,' Clear')]    timeout=15s
    Wait Until Element Is Visible    xpath=//button[contains(.,' Search')]    timeout=15s
    Element Should Be Visible    xpath=//button[contains(.,' Clear')]
    Click Element    xpath=//button[contains(.,' Clear')]
    # ${MyValue} =    Get Text    xpath=//span[contains(.,'Type')]
    # Log    ${MyValue}
    Wait Until Element Contains    xpath=//span[contains(.,'Type')]    Type    timeout=15s

    # Test the preset 02 Who made a Dicom Query
    # Test the preset 03 Who made a Dicom Send
    # Test the preset 04 Who removed a label
    # Test the preset 05 All events related to an audit source (TMRHE, TMAA, TMP, Uploader...)
    # Wait Until Element Is Visible    xpath=//div[4]/div/fieldset/form/div/div/mat-form-field/div/div/div/input    timeout=15s
    # Input Text    xpath=//div[4]/div/fieldset/form/div/div/mat-form-field/div/div/div/input    TMAA2.simon.be    clear=True
    # Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    xpath=//div[4]/div/fieldset/form/div/div/mat-form-field/div/div/div/input    TMAA2.simon.be
    # Sleep    5s
    # Test the preset 06 All events that happened between dates
    # Test the preset 07 All events related to a patient
    # Test the preset 08 Who accessed a patient
    # Test the preset 09 Who modified a patient
    # Test the preset 10 All events related to a document
    # Test the preset 11 Who accessed a document
    # Test the preset 12 Who deleted a document
    # Test the preset 13 Who modified a study

    Input Text    ${Preset02z01}    Preset02z01    clear=True
    Input Text    ${Preset02z02}    Preset02z02    clear=True
    Input Text    ${Preset03z01}    Preset03z01    clear=True
    Input Text    ${Preset03z02}    Preset03z02    clear=True
    Input Text    ${Preset04z01}    Preset04z01    clear=True
    Input Text    ${Preset04z02}    Preset04z02    clear=True

    Input Text    ${Preset05z01}    Preset05z01    clear=True
    Take My Screenshot

    Input Text    ${Preset06z01}    01/01/2025    clear=True
    Input Text    ${Preset06z02}    03/01/2025    clear=True
    Input Text    ${Preset07z01}    Preset07z01    clear=True
    Input Text    ${Preset07z02}    Preset07z02    clear=True
    Input Text    ${Preset08z01}    Preset08z01    clear=True
    Input Text    ${Preset08z02}    Preset08z02    clear=True
    Input Text    ${Preset09z01}    Preset09z01    clear=True
    Input Text    ${Preset09z02}    Preset09z02    clear=True
    Input Text    ${Preset10z01}    Preset10z01    clear=True
    Input Text    ${Preset10z02}    Preset10z02    clear=True
    Input Text    ${Preset11z01}    Preset11z01    clear=True
    Input Text    ${Preset11z02}    Preset11z02    clear=True
    Input Text    ${Preset12z01}    Preset12z01    clear=True
    Input Text    ${Preset12z02}    Preset12z02    clear=True
    Input Text    ${Preset13z01}    Preset13z01    clear=True

    Sleep    5s
    Take My Screenshot

Test 05
    [Documentation]    Test the tab Search
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Search    timeout=15s
    Element Should Be Visible    link=Search
    Click Link    link=Search
    Sleep    3s
    Wait Until Element Is Visible    name=eventType    timeout=15s
    # Select one item from the combo box Event
    Element Should Be Visible    name=eventType
    Click Element    name=eventType
    Element Should Be Visible    xpath=//span[contains(.,'FILMER')]
    Click Element    xpath=//span[contains(.,'FILMER')]
    Sleep    1s

Test 06
    [Documentation]    Test the tab Presets (2nd time)
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Element Should Be Visible    link=Presets
    Click Link    link=Presets
    Sleep    4s
    Input Text    ${Preset02z01}    Preset02z01    clear=True
    Input Text    ${Preset02z02}    Preset02z02    clear=True
    Input Text    ${Preset03z01}    Preset03z01    clear=True
    Input Text    ${Preset03z02}    Preset03z02    clear=True
    Input Text    ${Preset04z01}    Preset04z01    clear=True
    Input Text    ${Preset04z02}    Preset04z02    clear=True
    Sleep    3s
    Take My Screenshot

    Input Text    ${Preset05z01}    Preset05z01    clear=True

    Input Text    ${Preset06z01}    01/01/2025    clear=True
    Input Text    ${Preset06z02}    03/01/2025    clear=True
    Input Text    ${Preset07z01}    Preset07z01    clear=True
    Input Text    ${Preset07z02}    Preset07z02    clear=True
    Input Text    ${Preset08z01}    Preset08z01    clear=True
    Input Text    ${Preset08z02}    Preset08z02    clear=True
    Input Text    ${Preset09z01}    Preset09z01    clear=True
    Input Text    ${Preset09z02}    Preset09z02    clear=True
    Input Text    ${Preset10z01}    Preset10z01    clear=True
    Input Text    ${Preset10z02}    Preset10z02    clear=True
    Input Text    ${Preset11z01}    Preset11z01    clear=True
    Input Text    ${Preset11z02}    Preset11z02    clear=True
    Input Text    ${Preset12z01}    Preset12z01    clear=True
    Input Text    ${Preset12z02}    Preset12z02    clear=True
    Input Text    ${Preset13z01}    Preset13z01    clear=True
    Sleep    3s
    Take My Screenshot

Test 07
    [Documentation]    Test the tab Search (2nd time)
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Search    timeout=15s
    Element Should Be Visible    link=Search
    Click Link    link=Search
    Sleep    3s
    Wait Until Element Is Visible    name=eventType    timeout=15s
    # Select one item from the combo box Event
    Element Should Be Visible    name=eventType
    Click Element    name=eventType
    Element Should Be Visible    xpath=//span[contains(.,'FILMER')]
    Click Element    xpath=//span[contains(.,'FILMER')]
    Sleep    1s

Test 08
    [Documentation]    Test the tab Presets (3rd time)
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Element Should Be Visible    link=Presets
    Click Link    link=Presets
    Sleep    4s

    Input Text    ${Preset03z02}    Preset03z02    clear=True

    Input Text    ${Preset04z02}    Preset04z02    clear=True
    Sleep    3s
    Take My Screenshot

    Input Text    ${Preset05z01}    Preset05z01    clear=True

    Input Text    ${Preset06z01}    01/01/2025    clear=True
    Input Text    ${Preset06z02}    03/01/2025    clear=True
    Input Text    ${Preset07z01}    Preset07z01    clear=True
    Input Text    ${Preset07z02}    Preset07z02    clear=True
    Input Text    ${Preset08z01}    Preset08z01    clear=True

    Input Text    ${Preset09z01}    Preset09z01    clear=True
    Input Text    ${Preset09z02}    Preset09z02    clear=True
    Input Text    ${Preset10z01}    Preset10z01    clear=True
    Input Text    ${Preset10z02}    Preset10z02    clear=True

    Input Text    ${Preset12z01}    Preset12z01    clear=True
    Input Text    ${Preset12z02}    Preset12z02    clear=True
    Input Text    ${Preset13z01}    Preset13z01    clear=True
    Sleep    9s
    Take My Screenshot
