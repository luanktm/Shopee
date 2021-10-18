*** Setting ***
Resource    ${CURDIR}/../resources/import.robot

Test Setup    common_keywords.Open Application    ${device_info.luan_device}
Test Teardown    Run Keywords    common_keywords.Close Application
Test Template    Get Product From Search Function
Library    DataDriver    file=../resources/data_test/data_search_valid.xlsx    sheet_name=search_function    encoding=UTF-8

*** Keywords ***
Get Product From Search Function
    [Arguments]    ${keyword}    ${limit}
    home_page.Click On Search Text Box
    home_page.Input Text Into Search Text Box    ${keyword}
    search_feature.Verify Data Suggestion Is Displayed Correctly With UI    ${keyword}
    common_keywords.Click On Seach Button On Keyboard
    search_feature.Verify Product Data Is Displayed Correctly With UI    ${keyword}    ${limit}
    
*** Test Cases ***
Verify search funcation    ${keyword}    ${limit}