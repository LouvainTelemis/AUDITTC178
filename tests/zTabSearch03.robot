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
${MyPatient1DocId}    A2.sim.d2b8.be.simon.P1.1

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
${MyPatient2DocId}    A2.sim.2e1d.be.simon.P1.5

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
${MyLabelName1}    EMERGENCY

${MyDateFrom1}    01/01/2025
${MyDateTo1}    02/23/2025

${PresetName01}    All audit events related to its type
${PresetName02}    Who made a Dicom Query
${PresetName03}    Who made a Dicom Send
${PresetName04}    Who removed a label
${PresetName05}    All events related to an audit source
${PresetName06}    All events that happened between dates
${PresetName07}    All events related to a patient
${PresetName08}    Who accessed a patient
${PresetName09}    Who modified a patient
${PresetName10}    All events related to a document
${PresetName11}    Who accessed a document
${PresetName12}    Who deleted a document
${PresetName13}    Who modified a study

# xpath of input boxes located in the tab Presets (Predefined search)

# P01z01 [All audit events related to its type] Combo box [Type]
${Preset01z01}    xpath=//span[contains(.,'Type')]

# P02z01 [Who made a Dicom Query] Input box #1 [Accession Number]
# P02z02 [Who made a Dicom Query] Input box #2 [Document ID]
${Preset02z01}    xpath=//div/div/input
${Preset02z02}    xpath=//div[2]/mat-form-field/div/div/div/input

# P03z01 [Who made a Dicom Send] Input box #1 [Accession Number]
# P03z02 [Who made a Dicom Send] Input box #2 [Document ID]
${Preset03z01}    xpath=//fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset03z02}    xpath=//fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

# P04z01 [Who removed a label] Input box #1 [Label]
# P04z02 [Who removed a label] Input box #2 [Accession Number]
${Preset04z01}    xpath=//div[3]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset04z02}    xpath=//div[3]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

# P05z01 [All events related to an audit source (TMRHE, TMAA, TMP, Uploader...)] Input box [Source]
${Preset05z01}    xpath=//div[4]/div/fieldset/form/div/div/mat-form-field/div/div/div/input

# P06z01 [All events that happened between dates] Input box #1 [from] MM/DD/YYYY
# P06z02 [All events that happened between dates] Input box #2 [to] MM/DD/YYYY
${Preset06z01}    xpath=//div[4]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset06z02}    xpath=//div[4]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

# P07z01 [All events related to a patient] Input box #1 [Patient Name]
# P07z02 [All events related to a patient] Input box #2 [Patient ID]
${Preset07z01}    xpath=//div[5]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset07z02}    xpath=//div[5]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

# P08z01 [Who accessed a patient] Input box #1 [Patient Name]
# P08z02 [Who accessed a patient] Input box #2 [Patient ID]
${Preset08z01}    xpath=//div[5]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset08z02}    xpath=//div[5]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

# P09z01 [Who modified a patient] Input box #1 [Patient Name]
# P09z02 [Who modified a patient] Input box #2 [Patient ID]
${Preset09z01}    xpath=//div[5]/div/fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset09z02}    xpath=//div[5]/div/fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

# P10z01 [All events related to a document] Input box #1 [Accession Number]
# P10z02 [All events related to a document] Input box #2 [Document ID]
${Preset10z01}    xpath=//div[6]/div/fieldset/form/div/div/mat-form-field/div/div/div/input
${Preset10z02}    xpath=//div[6]/div/fieldset/form/div/div[2]/mat-form-field/div/div/div/input

# P11z01 [Who accessed a document] Input box #1 [Accession Number]
# P11z02 [Who accessed a document] Input box #2 [Document ID]
${Preset11z01}    xpath=//div[6]/div/fieldset[2]/form/div/div/mat-form-field/div/div/div/input
${Preset11z02}    xpath=//div[6]/div/fieldset[2]/form/div/div[2]/mat-form-field/div/div/div/input

# P12z01 [Who deleted a document] Input box #1 [Accession Number]
# P12z02 [Who deleted a document] Input box #2 [Document ID]
${Preset12z01}    xpath=//div[6]/div/fieldset[3]/form/div/div/mat-form-field/div/div/div/input
${Preset12z02}    xpath=//div[6]/div/fieldset[3]/form/div/div[2]/mat-form-field/div/div/div/input

# P13z01 [Who modified a study] Input box [Accession Number]
${Preset13z01}    xpath=//fieldset[4]/form/div/div/mat-form-field/div/div/div/input

# xpath of the buttons Clear and Search

${Preset01C}    xpath=//button[contains(.,' Clear')]
${Preset01S}    xpath=//button[contains(.,' Search')]

${Preset02C}    xpath=//fieldset[2]/form/div[2]/div/button
${Preset02S}    xpath=//fieldset[2]/form/div[2]/div/button[2]

${Preset03C}    xpath=//fieldset[3]/form/div[2]/div/button
${Preset03S}    xpath=//fieldset[3]/form/div[2]/div/button[2]

${Preset04C}    xpath=//div[3]/div/fieldset/form/div[2]/div/button
${Preset04S}    xpath=//div[3]/div/fieldset/form/div[2]/div/button[2]

${Preset05C}    xpath=//div[4]/div/fieldset/form/div[2]/div/button
${Preset05S}    xpath=//div[4]/div/fieldset/form/div[2]/div/button[2]

${Preset06C}    xpath=//div[4]/div/fieldset[2]/form/div[2]/div/button
${Preset06S}    xpath=//div[4]/div/fieldset[2]/form/div[2]/div/button[2]

${Preset07C}    xpath=//div[5]/div/fieldset/form/div[2]/div/button
${Preset07S}    xpath=//div[5]/div/fieldset/form/div[2]/div/button[2]

${Preset08C}    xpath=//div[5]/div/fieldset[2]/form/div[2]/div/button
${Preset08S}    xpath=//div[5]/div/fieldset[2]/form/div[2]/div/button[2]

${Preset09C}    xpath=//div[5]/div/fieldset[3]/form/div[2]/div/button
${Preset09S}    xpath=//div[5]/div/fieldset[3]/form/div[2]/div/button[2]

${Preset10C}    xpath=//div[6]/div/fieldset/form/div[2]/div/button
${Preset10S}    xpath=//div[6]/div/fieldset/form/div[2]/div/button[2]

${Preset11C}    xpath=//div[6]/div/fieldset[2]/form/div[2]/div/button
${Preset11S}    xpath=//div[6]/div/fieldset[2]/form/div[2]/div/button[2]

${Preset12C}    xpath=//div[6]/div/fieldset[3]/form/div[2]/div/button
${Preset12S}    xpath=//div[6]/div/fieldset[3]/form/div[2]/div/button[2]

${Preset13C}    xpath=//fieldset[4]/form/div[2]/div/button
${Preset13S}    xpath=//fieldset[4]/form/div[2]/div/button[2]

# Locators of search criteria in the tab Search

${CriterionLocator01}    name=outcome
${CriterionLocator02}    name=from
${CriterionLocator03}    name=to
${CriterionLocator04}    name=action
${CriterionLocator05}    name=eventType
${CriterionLocator06}    name=user
${CriterionLocator07}    name=source
${CriterionLocator08}    name=destination
${CriterionLocator09}    name=patientId
${CriterionLocator10}    name=patientName
${CriterionLocator11}    name=accessionNumber
${CriterionLocator12}    name=documentId

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
    [Documentation]    User enters the login and password to access Site Manager
    [Tags]    CRITICALITY HIGH
    My User Opens Internet Browser And Connects To Site Manager    ${SiteManagerUser1Login}    ${SiteManagerUser1Password}
    Take My Screenshot

Test03
    [Documentation]    User selects and opens the interface of Audit
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Audit    timeout=15s
    Element Should Be Visible    link=Audit
    Click Link    link=Audit
    Sleep    2s
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

Test 04
    [Documentation]    Open the tab Search of Audit and check the user interface (12 search criteria)
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    link=Search    timeout=15s
    Element Should Be Visible    link=Search
    Click Link    link=Search
    # Check 12 search criteria
    Wait Until Element Is Visible    ${CriterionLocator01}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator02}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator03}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator04}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator05}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator06}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator07}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator08}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator09}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator10}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator11}    timeout=15s
    Wait Until Element Is Visible    ${CriterionLocator12}    timeout=15s

Test 05
    [Documentation]    Check that the table of Search is visible in the web page
    [Tags]    CRITICALITY NORMAL
    # Check 7 columns of the table
    Wait Until Page Contains    Outcome    timeout=15s
    Wait Until Page Contains    Timestamp    timeout=15s
    Wait Until Page Contains    Event    timeout=15s
    Wait Until Page Contains    User    timeout=15s
    Wait Until Page Contains    Source    timeout=15s
    Wait Until Page Contains    Destination    timeout=15s
    Wait Until Page Contains    Patient    timeout=15s
    Wait Until Page Contains    Accession Number    timeout=15s

Test 06
    [Documentation]    Test and check the search criterion #01 (Outcome) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    ${CriterionLocator01}    timeout=15s
    Element Should Be Visible    ${CriterionLocator01}
    Click Element    ${CriterionLocator01}
    # Select one item from the combo box Outcome
    Wait Until Element Is Visible    xpath=//span[contains(.,' SUCCESS')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' FAILURE')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,' SUCCESS')]
    Click Element    xpath=//span[contains(.,' SUCCESS')]
    Wait Until Element Contains    ${CriterionLocator01}    SUCCESS    timeout=15s
    # Please use the keyword Get Text instead of Get Value
    ${MyValue} =    Get Text    ${CriterionLocator01}
    Log    ${MyValue}
    Should Contain    ${MyValue}    SUCCESS
    # Empty the field(s)
    Wait Until Element Is Visible    xpath=//button[contains(.,'Clear')]    timeout=15s
    Wait Until Element Is Visible    css=.fa-search    timeout=15s
    Click Element    css=.fa-search
    Wait Until Page Contains    Previous    timeout=15s
    Take My Screenshot
    Click Button    xpath=//button[contains(.,'Clear')]
    Wait Until Element Contains    ${CriterionLocator01}    Outcome    timeout=15s
    # It does not work with the keyword Textfield Should Contain (Textfield Should Contain    name=outcome    Outcome)
    ${MyValue} =    Get Text    ${CriterionLocator01}
    Log    ${MyValue}

Test 07
    [Documentation]    Test and check the search criterion #02 (Date From MM/DD/YYYY) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator02}    ${MyDateFrom1}

Test 08
    [Documentation]    Test and check the search criterion #03 (Date To MM/DD/YYYY) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator03}    ${MyDateTo1}

Test 09
    [Documentation]    Test and check the search criterion #04 (Action) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    ${CriterionLocator04}    timeout=15s
    Element Should Be Visible    ${CriterionLocator04}
    # Select one item from the combo box
    Click Element    ${CriterionLocator04}
    Wait Until Element Is Visible    xpath=//span[contains(.,' CREATE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' READ')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' UPDATE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' DELETE')]    timeout=15s
    Wait Until Element Is Visible    xpath=//span[contains(.,' EXECUTE')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,' EXECUTE')]
    Click Element    xpath=//span[contains(.,' EXECUTE')]
    Wait Until Element Contains    ${CriterionLocator04}    EXECUTE    timeout=15s

Test 10
    [Documentation]    Test and check the search criterion #05 (Event) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    ${CriterionLocator05}    timeout=15s
    Element Should Be Visible    ${CriterionLocator05}
    # Select one item from the combo box Event
    Click Element    ${CriterionLocator05}
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
    Sleep    2s
    # The check fails with the keyword Wait Until Element Contains, see example below, you must check with the keyword Get Value, it does NOT work with the keyword Get Text
    # Wait Until Element Contains    name=eventType    FILMER    timeout=15s
    ${MyValue} =    Get Value    ${CriterionLocator05}
    Log    ${MyValue}
    Should Contain    ${MyValue}    FILMER

Test 11
    [Documentation]    Test and check the search criterion #06 (User) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator06}    ${SiteManagerUser2Login}

Test 12
    [Documentation]    Test and check the search criterion #07 (Source) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator07}    ${MySource1}

Test 13
    [Documentation]    Test and check the search criterion #08 (Destination) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator08}    ${MyDestination1}

Test 14
    [Documentation]    Test and check the search criterion #09 (Patient ID) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator09}    ${MyPatient1PatientID}

Test 15
    [Documentation]    Test and check the search criterion #10 (Patient Name) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator10}    ${MyPatient1FamilyName}

Test 16
    [Documentation]    Test and check the search criterion #11 (Accession Number) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator11}    ${MyPatient1AccessionNumber}

Test 17
    [Documentation]    Test and check the search criterion #12 (Document ID) in the tab Search
    [Tags]    CRITICALITY NORMAL
    Fill My Input Box Of Search Criterion In Tab Search    ${CriterionLocator12}    ${MyPatient1DocId}
    Take My Screenshot

Test 18
    [Documentation]    Test and check the buttons Clear and Search
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    xpath=//button[contains(.,'Clear')]    timeout=15s
    Wait Until Element Is Visible    css=.fa-search    timeout=15s
    Element Should Be Visible    xpath=//button[contains(.,'Clear')]
    Element Should Be Visible    css=.fa-search
    # Empty all the fields
    Click Button    xpath=//button[contains(.,'Clear')]
    Wait Until Element Contains    name=patientName    ${EMPTY}    timeout=15s
    Textfield Value Should Be    name=patientName    ${EMPTY}
    ${MyValue} =    Get Text    name=patientName
    Log    ${MyValue}
    Take My Screenshot
    Unselect Frame

Test90
    [Documentation]    User exits Site Manager
    [Tags]    CRITICALITY NORMAL
    # Before logging out the user session, check that the iframe has been deselected
    Log Out My User Session Of Site Manager
    Close All Browsers
