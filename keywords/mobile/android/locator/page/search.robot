*** Variables ***
&{search}
...    suggestion_part=xpath//android.widget.ScrollView
...    category_part=xpath//android.widget.TextView[@text='Danh Mục']
...    data_suggestion=xpath//android.widget.TextView
...    data_hint=xpath=//android.widget.TextView[contains(@text, '{param}')]
...    warning_message=xpath//android.widget.TextView[contains(@text,'{param}')]
...    wrap=xpath=//android.widget.FrameLayout[@resource-id='android:id/content']
...    product_name=//android.widget.TextView[contains(@text,'{param}')]
...    product_infor=//android.widget.TextView[contains(@text,'{param}')]/parent::android.view.ViewGroup//following-sibling::android.view.ViewGroup//android.widget.TextView[@text='{location}']
