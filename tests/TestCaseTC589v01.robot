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

# List of event names

${EventName01}    DOC_ACCESS
${EventName02}    DOC_TRANSFER
${EventName03}    DOC_START_TRANSFER
${EventName04}    DOC_FORWARD
${EventName05}    DOC_EXPORT
${EventName06}    DOC_IMPORT
${EventName07}    DOC_REPORT
${EventName08}    DOC_STORE
${EventName09}    DOC_DELETED
${EventName10}    DOC_QUERY
${EventName11}    MEASURES_MGT
${EventName12}    PATIENT_ACCESS
${EventName13}    WORKLIST_MGT
${EventName14}    LABEL_MGT
${EventName15}    MESSAGES_MGT
${EventName16}    NOTES_MGT
${EventName17}    CONSENT_MGT
${EventName18}    APP_START
${EventName19}    APP_STOP
${EventName20}    USER_LOGIN
${EventName21}    USER_LOGOUT
${EventName22}    USER_MGT
${EventName23}    ROLE_MGT
${EventName24}    PRESET_MGT
${EventName25}    PROPERTIES_MGT
${EventName26}    BUNDLE_ACQUIRED
${EventName27}    FILMER
${EventName28}    TASK_MGT
${EventName29}    JOB_START
${EventName30}    JOB_STOP
${EventName31}    JOB_CANCEL



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
    Sleep    1s
    Click Element    xpath=//span[contains(.,'${MyEventName}')]
    Sleep    1s
    Wait Until Element Contains    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Element Should Contain    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}
    # Check the button Search
    Wait Until Element Is Visible    ${Preset01S}    timeout=15s
    Element Should Be Visible    ${Preset01S}
    Sleep    2s
    Click Element    ${Preset01S}
    Sleep    2s
    Wait Until Page Contains    Timestamp    timeout=15s
    Wait Until Page Contains    Event    timeout=15s
    Wait Until Page Contains    ${MyEventName}    timeout=15s
    Take My Screenshot
    Sleep    1s


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

TEST01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

TEST02
    [Documentation]    Check that Site Manager is running
    [Tags]    CRITICALITY NORMAL
    Check That Site Manager Is Running

TEST03
    [Documentation]    Check the version number of Site Manager
    [Tags]    CRITICALITY NORMAL
    Check Version Of Site Manager

TEST04
    [Documentation]    Check that Audit is running, and then check the version number of the application
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntityPort1}
    Check Version Of Telemis Entity    ${MyEntityName1}    ${MyEntityPort1}

TEST05
    [Documentation]    User enters the login and password to access Site Manager
    [Tags]    CRITICALITY HIGH
    My User Opens Internet Browser And Connects To Site Manager    ${SiteManagerUser1Login}    ${SiteManagerUser1Password}
    Take My Screenshot

TEST06
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

TEST07
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

TEST08
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

TEST09
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

TEST10
    [Documentation]    Check and test the audited event #01 (DOC_ACCESS)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName01}

TEST11
    [Documentation]    Check and test the audited event #02 (DOC_TRANSFER)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName02}

TEST12
    [Documentation]    Check and test the audited event #03 (DOC_START_TRANSFER)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName03}

TEST13
    [Documentation]    Check and test the audited event #04 (DOC_FORWARD)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName04}

TEST14
    [Documentation]    Check and test the audited event #05 (DOC_EXPORT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName05}

TEST15
    [Documentation]    Check and test the audited event #06 (DOC_IMPORT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName06}

TEST16
    [Documentation]    Check and test the audited event #07 (DOC_REPORT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName07}

TEST17
    [Documentation]    Check and test the audited event #08 (DOC_STORE)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName08}

TEST18
    [Documentation]    Check and test the audited event #09 (DOC_DELETED)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName09}


TEST19
    [Documentation]    Check and test the audited event #10 (DOC_QUERY)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName10}

TEST20
    [Documentation]    Check and test the audited event #11 (MEASURES_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName11}

TEST21
    [Documentation]    Check and test the audited event #12 (PATIENT_ACCESS)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName12}

TEST22
    [Documentation]    Check and test the audited event #13 (WORKLIST_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName13}

TEST23
    [Documentation]    Check and test the audited event #14 (LABEL_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName14}

TEST24
    [Documentation]    Check and test the audited event #15 (MESSAGES_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName15}

TEST25
    [Documentation]    Check and test the audited event #16 (NOTES_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName16}

TEST26
    [Documentation]    Check and test the audited event #17 (CONSENT_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName17}

TEST27
    [Documentation]    Check and test the audited event #18 (APP_START)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName18}

TEST28
    [Documentation]    Check and test the audited event #19 (APP_STOP)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName19}


TEST29
    [Documentation]    Check and test the audited event #20 (USER_LOGIN)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName20}

TEST30
    [Documentation]    Check and test the audited event #21 (USER_LOGOUT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName21}

TEST31
    [Documentation]    Check and test the audited event #22 (USER_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName22}

TEST32
    [Documentation]    Check and test the audited event #23 (ROLE_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName23}

TEST33
    [Documentation]    Check and test the audited event #24 (PRESET_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName24}

TEST34
    [Documentation]    Check and test the audited event #25 (PROPERTIES_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName25}

TEST35
    [Documentation]    Check and test the audited event #26 (BUNDLE_ACQUIRED)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName26}

TEST36
    [Documentation]    Check and test the audited event #27 (FILMER)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName27}

TEST37
    [Documentation]    Check and test the audited event #28 (TASK_MGT)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName28}

TEST38
    [Documentation]    Check and test the audited event #29 (JOB_START)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName29}

TEST39
    [Documentation]    Check and test the audited event #30 (JOB_STOP)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName30}

TEST40
    [Documentation]    Check and test the audited event #31 (JOB_CANCEL)
    [Tags]    CRITICALITY NORMAL
    Check And Test My Event Name    ${EventName31}


TEST41
    [Documentation]    Quit the user interface of Audit
    [Tags]    CRITICALITY NORMAL
    Unselect Frame

TEST42
    [Documentation]    User exits Site Manager
    [Tags]    CRITICALITY NORMAL
    # Before logging out the user session, check that the iframe has been deselected
    Log Out My User Session Of Site Manager
    Close All Browsers
