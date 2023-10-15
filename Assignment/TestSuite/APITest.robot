*** Settings ***
Documentation       This Tests Suite Tests Both poseteive and Negateive cases for Registration and Login api Endpoints.
...                 (Runnning in diffrent envs)robot --logtitle "Smoke Test Log" --reporttitle "Smoke Test Report"  -d ../Reports  -V variables/env-int.py  Tests\*.*
...                 (Test by tag): robot -i [tagname] -d ../Reports *.robot ( all tests): robot -d Reports *.robot
...                 robot -i Regression -d ../Reports *.robot   (For only Regression tests)
Resource   ../Resources/Setup.robot
Suite setup     Create Session  Test    ${BASE_URL}
Suite teardown  Delete all sessions
***Test Cases***
TC01.Validate Api-Endpoint
  [Tags]  Smoke
  [Documentation]    This is a dry run Testcase which tests
...  if the Customer Get endpoint works correctly
  Ping Server

TC02.Register New user and account with Valid Input
    [Tags]  Smoke  Regression
    [Documentation]   This Testcase  tests if the Customer Registration
...   endpoint works correctly with Valid Input
    Account Regestration
TC03.Validate if Invalid input Reject New account registration and provide correct Error message
    [Tags]  Smoke  Regression
    [Documentation]   This Testcase  tests if the Customer Registration
...   endpoint works correctly with inValid Input
    Account Regestration Errorcase
TC04.Conform the Login Api works successfully with valid Credentials
    [Tags]  Smoke  Regression
    [Documentation]   This Testcase  tests if the Account Login
...   endpoint works correctly with Valid Input
   Account Login
TC05.Validate if Login Api provide proprr validation for Invalid Credentials
    [Tags]  Smoke  Regression
    [Documentation]   This Testcase  tests if the Account Login
...   endpoint works correctly with InValid Input and provide correct Validation
   Account Login ErrorCase

