*** Setting ***
Resource    ${CURDIR}/../resources/import.robot

Test Setup    common_keywords.Open Application    ${device_info.luan_device}
Test Teardown    Run Keywords    common_keywords.Close Application

*** Test Cases ***
Verify Search Text Box And Searh Icon Should Be Displayed
    search_feature.Verify Search Text Box And Search Icon Should Be Displayed

Verify Search Suggestion Should Be Displayed
    search_feature.Verify Suggestion Should Be Displayed With Section