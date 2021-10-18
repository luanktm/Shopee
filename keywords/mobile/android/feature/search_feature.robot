*** Variables ***
${suggestion_data}    //android.widget.TextView[@text='{param}']

*** Keywords ***
Verify Search Text Box And Search Icon Should Be Displayed
    home_page.Verify Search Icon Is Visible
    home_page.Verify Search Text Box Is Visible

Verify Suggestion Should Be Displayed With Section
    home_page.Click On Search Text Box
    common_keywords.Hide Keyboard
    search.Verify Suggestion Part Is Displayed
    search.Verify Category Is Visible

Verify Data Suggestion Is Displayed Correctly With UI
    [Arguments]    ${keyword}
    ${suggestion_ui_list}    search.Get List Data Suggestion    ${keyword}
    ${suggestion_res_list}    search_func_api.Get Suggestion Data With Search By KeyWord    ${keyword}
    List Should Contain Sub List    ${suggestion_res_list}    ${suggestion_ui_list}    

Verify Product Data Is Displayed Correctly With UI
    [Arguments]    ${keyword}    ${limit}
    ${products_name_list}    ${product_loc_list}    search_func_api.Get Product Data From Search    ${keyword}    ${limit}
    FOR    ${i}    IN RANGE    len(${products_name_list})
        log to console    ${products_name_list}[${i}]
        log to console    ${product_loc_list}[${i}]
       ${product_info}=    Format String    ${search.product_infor}    param=${products_name_list}[${i}]    location=${product_loc_list}[${i}]
       common_keywords.Scroll Down To Find Element    ${search.wrap}    ${product_info}
       common_keywords.Wait Until Element Is Visible    ${product_info}
    END

Verify Warning Message When Search By Invalid KeyWord
    [Arguments]    ${warning_message}
    search.Verify Warning Message    ${warning_message}