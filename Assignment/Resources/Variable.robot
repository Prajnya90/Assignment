*** Variables ***
#ENDPOINTS              ---
${BASE_URL}             http://restapi.adequateshop.com/api
#ENDPOINTS              --- Regestration
${REGISTR}              /AuthAccount/Registration
#ENDPOINTS              --- Login
${LOGIN}                /AuthAccount/Login
#HEADERS                ---
${CONTENT_TYPE}         application/json
${USR_Agent}            RobotFramework
#Regestration Details        ---
${FULLNAME}             Prajnya Mishra
${EMAIL}                Prajnya121@gmail.com
${PASSWORD}             ABC123
#AUTH                   ---
${LOGINEMAIL}            ${EMAIL}
${LOGINPASSWORD}         ${PASSWORD}
${INVALIDPASSWORD}       500