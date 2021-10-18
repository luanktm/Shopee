*** Setting ***
Resource    ${CURDIR}/../resources/import.robot

Test Setup    common_keywords.Open Application    ${device_info.luan_device}
Test Teardown    Run Keywords    common_keywords.Close Application
Test Template    Get Warning Message
Library    DataDriver    file=../resources/data_test/data_search_invalid.xlsx    sheet_name=Sheet2    encoding=UTF-8

*** Keywords ***
Get Warning Message
    [Arguments]    ${keyword}    ${warning_message}
    home_page.Click On Search Text Box
    home_page.Input Text Into Search Text Box    ${keyword}
    common_keywords.Click On Seach Button On Keyboard
    search_feature.Verify Warning Message When Search By Invalid KeyWord    ${warning_message}

*** Test Cases ***
Verify Message When Search With Invalid Keyword    ${keyword}    ${warning_message}