*** Settings ***
Library  Collections
Library  SeleniumLibrary

*** Test Cases ***
Heroku Login chrome
	${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
	#${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
	#Call Method    ${options}    add_experimental_option    prefs    ${prefs}
	#Call Method    ${options}    add_argument    --remote-debugging-port\=9222
	#Call Method    ${options}    add_argument    --remote-debugging-pipe
	#Call Method    ${options}    add_argument    --window-size\=1200,800
    #Call Method    ${options}    add_argument    --ignore-ssl-errors\=yes
    #Call Method    ${options}    add_argument    --ignore-certificate-errors
	#Call Method    ${options}    add_argument    --incognito
	#Call Method    ${options}    add_argument    --no-sandbox
    #Call Method    ${options}    add_argument    --disable-dev-shm-usage
	#Create Webdriver    Chrome    options=${options}

    #Open Browser  http://the-internet.herokuapp.com/login   chrome  options=${options}  
	Open Browser  http://the-internet.herokuapp.com/login   firefox
    Input Text  //input[@id='username']  tomsmith
    Input Text  //input[@id='password']  SuperSecretPassword!
    Click Button  Login
    Element Text Should be  //h4  Welcome to the Secure Area. When you are done click logout below.  Expected message is not shown
    Capture Page Screenshot
    Click Link  Logout
    Capture Page Screenshot

Heroku Login chrome headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    #### Added to ignore ssl errors
    Call Method    ${options}    add_argument    --ignore-ssl-errors\=yes
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    ####
    Create Webdriver    Chrome    options=${options}

    Open Browser  http://the-internet.herokuapp.com/login   chrome  options=${options}
    Input Text  //input[@id='username']  tomsmith
    Input Text  //input[@id='password']  SuperSecretPassword!
    Click Button  Login
    Element Text Should be  //h4  Welcome to the Secure Area. When you are done click logout below.  Expected message is not shown
    Capture Page Screenshot
    Click Link  Logout
    Capture Page Screenshot


