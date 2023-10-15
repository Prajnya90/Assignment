
***Keywords***
Ping Server
    Create Session      Customer        ${BASE_URL}     verify=True
    ${response}=        GET On Session     Customer        url=${BASE_URL}/Customer  expected_status=200
    Should Be Equal As Strings      ${response.status_code}     200

Account Regestration Errorcase
    [Documentation]    This Keyword is to test Error cases in Reg
    ${HEADERS}=         Create Dictionary
    ...                 Content-Type=${CONTENT_TYPE}
    ...                 User-Agent=${USR_Agent}
    Create Session      Registratiion       ${BASE_URL}     verify=True
    ${response}=        POST On Session       Registratiion       url=${BASE_URL}${REGISTR}        data={"name":"${FULLNAME}","email":"${EMAIL}","password":"${PASSWORD}"}      headers=${HEADERS}  expected_status=200
    Should Be Equal As Strings      ${response.status_code}     200
    Element should exist            ${response.json()}     .message
    ${message}=        Get From Dictionary       ${response.json()}        message
    Should Be Equal As Strings  ${message}   The email address you have entered is already registered

Account Regestration
    ${rnd}      Generate Random String    12   [LETTERS][NUMBERS]
    ${finlan}   Set Variable    ${rnd}
    ${Mail}   Catenate       ${finlan}@gmail.com
    ${EMAILN}        Set Variable      ${Mail}
    ${HEADERS}=         Create Dictionary
    ...                 Content-Type=${CONTENT_TYPE}
    ...                 User-Agent=${USR_Agent}
    Create Session      Registratiion       ${BASE_URL}     verify=True
    ${response}=        POST On Session        Registratiion       url=${BASE_URL}${REGISTR}        data={"name":"${FULLNAME}","email":"${EMAILN}","password":"${PASSWORD}"}      headers=${HEADERS}  expected_status=200
    Should Be Equal As Strings      ${response.status_code}     200
    Element should exist            ${response.json()}     .message
    ${message}=        Get From Dictionary       ${response.json()}        message
     Should Be Equal As Strings  ${message}  success
     ${Data}=      Get From Dictionary       ${response.json()}        data
     log to console                   ${message}
     log to console                    ${Data}


Account Login
    ${HEADERS}=         Create Dictionary
    ...                 Content-Type=${CONTENT_TYPE}
    ...                 User-Agent=${USR_Agent}
    Create Session      Login       ${BASE_URL}     verify=True
    ${response}=        POST On Session         Login       url=${BASE_URL}${LOGIN}        data={"email":"${LOGINEMAIL}","password":"${LOGINPASSWORD}"}      headers=${HEADERS}   expected_status=200
    Should Be Equal As Strings      ${response.status_code}     200
     ${message}=        Get From Dictionary       ${response.json()}        message
     Should Be Equal As Strings  ${message}  success
     ${Data}=      Get From Dictionary       ${response.json()}        data
     log to console                   ${message}
     log to console                    ${Data}
Account Login ErrorCase
    [Documentation]    This Keyword is to test Error cases in Login
    ${HEADERS}=         Create Dictionary
    ...                 Content-Type=${CONTENT_TYPE}
    ...                 User-Agent=${USR_Agent}
    Create Session      Login       ${BASE_URL}     verify=True
    ${response}=         POST On Session        Login       url=${BASE_URL}${LOGIN}        data={"email":"${LOGINEMAIL}}","password":"${INVALIDPASSWORD}"}      headers=${HEADERS}  expected_status=200
    Should Be Equal As Strings      ${response.status_code}     200
     ${message}=        Get From Dictionary       ${response.json()}        message
     Should Be Equal As Strings  ${message}  invalid username or password
     ${Data}=      Get From Dictionary       ${response.json()}        data
     log to console                   ${message}
     log to console                    ${Data}

New Keyword
   [Documentation]    This Keyword is never used in current tests
    ${rnd}      Generate Random String    12   [LETTERS][NUMBERS]
    ${finlan}   Set Variable    ${rnd}
    ${Mail}   Catenate       ${finlan}@gmail.com
    ${EMAILN}        Set Variable      ${Mail}
     log to console   ${EMAILN}