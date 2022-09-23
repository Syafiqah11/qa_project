*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${login_email}    //input[@type='email']
${login_password}    //input[@type='password']
${submit_button}    //button[@type='submit']

*** Test Cases ***
Login to Deriv
    Open Browser    https://app.deriv.com/    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    ${login_button}
    Wait Until Page Contains Element    ${login_email}    10
    Input Text    ${login_email}    nurul.syafiqah+555@besquare.com.my
    Input Text    ${login_password}    abcdE123^^*
    Click Element    ${submit_button}
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Access Account Settings & Token Page
    Wait Until Page Does Not Contain Element    //*[@aria-label='Loading interface...']    30
    Click Element    //a[@class='account-settings-toggle']
    Wait Until Page Contains Element    //div[@class='account-form__footer']
    Click Element    //a[@id='dc_api-token_link']

Create Button is Disabled
    Wait Until Page Contains Element    //input[@class='dc-input__field']    30
    Input Text    //input[@class='dc-input__field']    hello
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Press Keys  //input[@class='dc-input__field']    CTRL+a+BACKSPACE
    Click Element    (//div[@class='composite-checkbox api-token__checkbox'])[3]
    Input Text    //input[@class='dc-input__field']    a
    Sleep    2    
    Press Keys  //input[@class='dc-input__field']    CTRL+a+BACKSPACE
    Input Text    //input[@class='dc-input__field']    *&^%$*
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Clear Element Text    //input[@class='dc-input__field']
    Press Keys  //input[@class='dc-input__field']    CTRL+a+BACKSPACE   
    
Create Token
    Clear Element Text    //input[@class='dc-input__field']
    Click Element    (//div[@class='composite-checkbox api-token__checkbox'])[4]
    Input Text    //input[@class='dc-input__field']    token7
    Wait Until Element Is Enabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

Copy the API token from token list
    Click Element    (//*[@data-testid='dt_copy_token_icon'])[1]
    Wait Until Page Contains Element    //div[@class='dc-modal__container dc-modal__container--small dc-modal__container--enter-done']    30
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

View / Hide token from token list
    Click Element    (//*[@data-testid='dt_toggle_visibility_icon'])[1]
    Sleep    2
    Click Element    (//*[@data-testid='dt_toggle_visibility_icon'])[1]
    Sleep    2

Delete token list
    Click Element    (//*[@data-testid='dt_token_delete_icon'])[1]
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button']
    Click Element    (//*[@data-testid='dt_token_delete_icon'])[1]
    Wait Until Page Contains Element    //div[@class='dc-modal__container dc-modal__container--small dc-modal__container--enter-done']    30
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']