*** Variables ***
${suggestion_part}    //android.widget.ScrollView
${category_part}    //android.widget.TextView[@text='Danh Mục']
${data_suggestion}    //android.widget.TextView
${warning_message}    //android.widget.TextView[contains(@text,'{param}')]

*** Keywords ***
Verify Suggestion Part Is Displayed
    common_keywords.Wait Until Element Is Visible    ${suggestion_part}

Verify Category Is Visible
    common_keywords.Wait Until Element Is Visible    ${category_part}

Get List Data Suggestion
    [Arguments]    ${keyword}
    ${search_hint_data}    Format String    ${search.data_hint}    param=${keyword}    
    common_keywords.Get Text Of Elements    ${search_hint_data}    
    ${products_name_list}    common_keywords.Get Text Of Elements    ${search_hint_data}
    [Return]    ${products_name_list}

Verify Warning Message
    [Arguments]    ${message}
    ${warning_message}=    Format String    ${warning_message}    param=${message}    
    common_keywords.Wait Until Element Is Visible    ${warning_message}    