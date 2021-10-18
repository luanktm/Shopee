*** Setting ***
Library    AppiumLibrary
Library    String
Library    Collections
Library    JSONLibrary
Library    REST    

Variables    ${CURDIR}/../resources/mobile_info.yaml
Variables    ${CURDIR}/../resources/config.yaml
Variables    ${CURDIR}/../resources/api_config.yaml
    

# # API
Resource    ${CURDIR}/../keywords/api/search_func_api.robot

# Common
Resource    ${CURDIR}/../keywords/mobile/android/common/common_keywords.robot

# # Page
Resource    ${CURDIR}/../keywords/mobile/android/page/home_page.robot
Resource    ${CURDIR}/../keywords/mobile/android/page/search.robot

# Locator
Resource    ${CURDIR}/../keywords/mobile/android/locator/page/home.robot
Resource    ${CURDIR}/../keywords/mobile/android/locator/page/search.robot

# # Common Function
# Resource    ${CURDIR}/../../keywords/mobile/android/function/common/common_android_functions.robot

# # Feature
Resource    ${CURDIR}/../keywords/mobile/android/feature/search_feature.robot