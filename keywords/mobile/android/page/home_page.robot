*** Variables ***
${deny_button}    //android.widget.Button[@text='DENY']
${input_text_box}    //android.view.ViewGroup/android.widget.ImageView//following-sibling::android.view.ViewGroup/preceding-sibling::android.widget.TextView
${search_icon}    //android.view.ViewGroup/preceding-sibling::android.widget.TextView/preceding-sibling::android.widget.ImageView

*** Keywords ***
Click On Deny Allow location
    common_keywords.Click Element    ${deny_button}
    common_keywords.Wait Until Element Is Not Visible    ${deny_button}

Input Text Into Search Text Box
    [Arguments]    ${text}
    common_keywords.Input Text    ${home}[text_box]    ${text}

Click On Search Text Box
    common_keywords.Click Element    ${input_text_box}

Verify Search Text Box Is Visible
    common_keywords.Wait Until Element Is Visible    ${input_text_box}

Verify Search Icon Is Visible
    common_keywords.Wait Until Element Is Visible    ${search_icon}