*** Variables ***
${big_locator}    //android.widget.RelativeLayout/android.widget.RelativeLayout
${start_button}    //android.widget.Button

*** Keywords ***
Open Application
    [Arguments]    ${device_data}    
    ${device_data_dict}    Create Dictionary
    ...    deviceName    ${device_data.deviceName}
    ...    platformName    ${device_data.platformName}
    ...    platformVersion    ${device_data.platformVersion}
    ...    app  ${device_data.app}
    ...    newCommandTimeout    ${device_data.newCommandTimeout}
    ...    noReset    ${device_data.noReset}
    ...    autoGrantPermissions    ${device_data.autoGrantPermissions}          
    AppiumLibrary.Open Application   http://127.0.0.1:4723/wd/hub    &{device_data_dict}
    common_keywords.Swipe Left To Find Element    ${big_locator}    ${start_button}
    common_keywords.Click Element    ${start_button}

Close Application
    [Documentation]    Close application
    Run Keyword And Ignore Error    AppiumLibrary.Close Application

Get Elements
    [Documentation]    This keyword for getting elements after verify these elements is visible
    ...                ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    Verify Elements Are Visible    @{elems}
    @{elements}    AppiumLibrary.Get Webelements    @{elems}
    [Return]    @{elements}
    
Get Text
    [Documentation]    Get text of element
    ...                ${locator}    - element
    [Arguments]    ${locator}
    common_keywords.Wait Until Element Is Visible    ${locator}
    ${text}    AppiumLibrary.Get Text    ${locator}
    [Return]    ${text}

Input Text
    [Documentation]    Input text into element
    [Arguments]    ${locator}    ${text}    ${timeout}=${GLOBALTIMEOUT}
    # verify element visible
    common_keywords.Wait Until Element Is Visible    ${locator}    ${timeout}
    # input text
    AppiumLibrary.Input Text    ${locator}    ${text}

Click Element
    [Documentation]    Click on element
    ...                ${locator}    - element
    ...                ${timeout}    - Waiting time for element visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    AppiumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Documentation]    Verify page contains elements
    [Arguments]    @{elements}
    FOR    ${element}    IN    @{elements}
        AppiumLibrary.Wait Until Page Contains Element    ${element}    timeout=${GLOBALTIMEOUT}
    END    

Wait Until Element Is Visible
    [Documentation]    Wait element is visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Wait Until Element Is Not Visible
    [Documentation]    Wait element is not visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for current page does not contain target element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    AppiumLibrary.Wait Until Page Does Not Contain Element    ${locator}    timeout=${timeout}

Click On Seach Button On Keyboard
    AppiumLibrary.Press Keycode    66

Get Text Of Elements
    [Arguments]    ${locator}   
    @{elements}    Get Elements    ${locator}
    ${elem_txt_list}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}    
        Append To List    ${elem_txt_list}    ${text}
    END
    [Return]    ${elem_txt_list}

Scroll Down To Find Element
    [Arguments]    ${scroallable_elem}    ${target_elem}    ${scroll_times}=10    ${scale_min}=0.2    ${scale_max}=0.8
    ${elem_locator}=    AppiumLibrary.Get Webelement    ${scroallable_elem}
    ${elem_size}=    AppiumLibrary.Get Element Size    ${elem_locator}
    ${elem_x_start}=    Evaluate    ${elem_size}[width] / 2
    ${elem_y_start}=      Evaluate    ${elem_size}[width] * ${scale_max}
    ${elem_y_end}=      Evaluate    ${elem_size}[width] * ${scale_min}
    ${ele_location}=    AppiumLibrary.Get Element Location     ${elem_locator}
    FOR   ${index}    IN RANGE    ${scroll_times}
        ${status}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible   ${target_elem}
        Run Keyword if    '${status}'=='${TRUE}'   Exit For Loop
        Swipe      ${elem_x_start}    ${elem_y_start}    ${elem_x_start}    ${elem_y_end}    1000
    END

Swipe Left To Find Element
    [Arguments]    ${scroallable_elem}    ${target_elem}    ${scroll_times}=10    ${scale_min}=0.2    ${scale_max}=0.95
    common_keywords.Wait Until Element Is Visible    ${scroallable_elem}
    ${elem_locator}=    AppiumLibrary.Get Webelement    ${scroallable_elem}
    ${elem_size}=    AppiumLibrary.Get Element Size    ${elem_locator}
    ${elem_x_start}=    Evaluate    ${elem_size}[width] * ${scale_max}
    ${elem_x_end}=    Evaluate    ${elem_size}[width] * ${scale_min}
    ${elem_y_start}=      Evaluate    ${elem_size}[height] * 0.5
    ${elem_location}=    AppiumLibrary.Get Element Location     ${elem_locator}
    FOR   ${index}    IN RANGE    ${scroll_times}
        ${status}=    Run Keyword And Return Status    AppiumLibrary.Element Should Be Visible   ${target_elem}
        Run Keyword if    '${status}'=='${TRUE}'   Exit For Loop
        Swipe      ${elem_x_start}    ${elem_y_start}    ${elem_x_end}    ${elem_y_start}    1000
    END

Hide Keyboard
    AppiumLibrary.Hide Keyboard