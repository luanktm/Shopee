*** Variables ***
${host}    https://mall.shopee.vn/api/v4/search

*** Keywords ***
Get Suggestion Data With Search By KeyWord
    [Arguments]    ${keyword}
    ${response}    Get Response For Suggestion Data With Search By Keyword    ${keyword}
    ${products_name_list}    Get Product Item From Suggestion With Search By Keyword    ${response}
    [Return]    ${products_name_list}    

Get Product Data From Search
    [Arguments]    ${keyword}    ${limit}
    ${response}    Get Response For Data Search With Search By Keyword    ${keyword}    ${limit}
    ${products_name_list}    ${products_price_list}    Get Product Data From Search With Search By Keyword     ${response}
    [Return]    ${products_name_list}    ${products_price_list}        

Get Response For Suggestion Data With Search By Keyword
    [Arguments]    ${keyword}
    &{header}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    &{query}=    Create Dictionary    search_type=3    keyword=${keyword}   version=2
    ${search_end_point}=   Set Variable    ${host}/search_hint?
    ${response}=    REST.Get    endpoint=${search_end_point}    query=&{query}    headers=&{header}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}

Get Response For Data Search With Search By Keyword
    [Arguments]    ${keyword}    ${limit}
    &{header}=    Create Dictionary    Accept=application/json    Content-Type=application/json    Host=mall.shopee.vn    Cookie=${COOKIE}    referer=${REFER}    x-api-source=rn    
    &{query}=    Create Dictionary    by=relevancy    keyword=${keyword}    limit=${limit}    newest=0    order=desc    page_type=search    scenario=PAGE_GLOBAL_SEARCH    version=2
    ${search_end_point}=   Set Variable    ${host}/search_items?
    ${response}=    REST.Get    endpoint=${search_end_point}    query=&{query}    headers=&{header}
    REST.Integer    response status    200
    ${response}=    REST.Output    response body
    [Return]    ${response}

Get Product Item From Suggestion With Search By Keyword
    [Arguments]    ${response}
    ${product_suggest}    JSONLibrary.Get Value From Json    ${response}    $..keywords[*].keyword
    ${products_name_list}    Create List
    
    FOR    ${i}    IN RANGE    len(${product_suggest})
        Append To List    ${products_name_list}    ${product_suggest}[${i}]
    END
    log to console    ${products_name_list}
    [Return]    ${products_name_list}

Get Product Item From Search With Search By Keyword
    [Arguments]    ${response}
    ${product_item}    JSONLibrary.Get Value From Json    ${response}    $..item_basic[*].name
    ${product_name_list}    Create List
    FOR    ${i}    IN RANGE    len(${product_item})
        Append To List    ${products_name_list}    ${product_item}[${i}]
    END
    log to console    ${products_name_list}
    [Return]    ${products_name_list}

Get Product Data From Search With Search By Keyword
    [Arguments]    ${response}
    ${products_name}    JSONLibrary.Get Value From Json    ${response}    $..item_basic[*].name
    ${products_price}    JSONLibrary.Get Value From Json    ${response}    $..item_basic[*].price
    ${products_location}    JSONLibrary.Get Value From Json    ${response}    $..item_basic[*].shop_location
    ${products_name_list}    Create List
    ${products_price_list}    Create List
    ${product_location_list}    Create List
    log to console    ${products_location}
    FOR    ${i}    IN RANGE    len(${products_name})
        Append To List    ${products_name_list}    ${products_name}[${i}]
        ${product_price_str}    Catenate    SEPARATOR=${SPACE}    ${products_price}[${i}]
        Append To List    ${products_price_list}    ${product_price_str}
    END
    [Return]    ${products_name_list}    ${products_location}


