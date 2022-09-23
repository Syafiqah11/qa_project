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

Access Account Settings & Closing Account Page
    Wait Until Page Does Not Contain Element    //*[@aria-label='Loading interface...']    30
    Click Element    //a[@class='account-settings-toggle']
    Wait Until Page Contains Element    //div[@class='account-form__footer']
    Click Element    //a[@id='dc_close-your-account_link']

Cancel Closing Account
    Sleep    3
    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']    30
    Click Element    //button[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']
    Wait Until Page Does Not Contain Element    //*[@aria-label='Loading interface...']    30
    Sleep    2

Close Account
    Click Element    //a[@class='account-settings-toggle']
    Wait Until Page Contains Element    //div[@class='account-form__footer']
    Click Element    //a[@id='dc_close-your-account_link']
    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']    30
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']
    Wait Until Page Contains Element    //div[@class='closing-account-reasons__footer']

Continue button is disabled
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    Input Text    (//textarea[@class='dc-input__field dc-input__textarea dc-input__field--placeholder-visible'])[1]    here is the text
    Input Text    (//textarea[@class='dc-input__field dc-input__textarea dc-input__field--placeholder-visible'])[2]    here is invalid text &(($))
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    
Continue button is enabled
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large']
    Sleep    3
    Click Element    //button[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']
    Wait Until Page Contains Element    //div[@class='closing-account-reasons__footer']    30
    Click Element    (//label[@class='dc-checkbox closing-account-reasons__checkbox'])[1]
    Click Element    (//label[@class='dc-checkbox closing-account-reasons__checkbox'])[3]
    Click Element    (//label[@class='dc-checkbox closing-account-reasons__checkbox'])[5]
    Input Text    (//textarea[@class='dc-input__field dc-input__textarea dc-input__field--placeholder-visible'])[1]    here is the text
    Input Text    (//textarea[@class='dc-input__field dc-input__textarea dc-input__field--placeholder-visible'])[2]    new valid text
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    Wait Until Page Contains Element    //div[@class='dc-modal__container dc-modal__container_closing-account-reasons dc-modal__container--enter-done']    30
    Sleep    2
    Click Element    (//button[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large'])[2]
    Sleep    2
    Click Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
    Wait Until Page Contains Element    //div[@class='dc-modal__container dc-modal__container_closing-account-reasons dc-modal__container--enter-done']    30
    Click Element    (//button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large'])[2]