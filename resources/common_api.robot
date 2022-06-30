*** Settings ***
Library                   QWeb
# Library                   QForce
Library                   String
Library                   RequestsLibrary
Library                   Collections

*** Variables ***
${sf_oauth2_url}          https://login.salesforce.com
${login_url}              https://login.salesforce.com
${sf_oauth2_path}         /services/oauth2/token
&{sf_oauth2_payload}      grant_type=password  client_id=${client_id}  client_secret=${client_secret}  username=${username}  password=${password}
&{sf_oauth2_headers}      Content-Type=application/x-www-form-urlencoded  Accept=application/json

*** Keywords ***
GetSfAccessToken
    [Documentation]       Get access_token from Salesforce
    OpenBrowser           about:blank  chrome
    Create Session        sforce  ${sf_oauth2_url}  headers=&{sf_oauth2_headers}  debug=3  verify=true
    ${resp}=              POST On Session
    ...                   alias=sforce  url=${sf_oauth2_path}
    ...                   headers=&{sf_oauth2_headers}
    ...                   data=${sf_oauth2_payload}
    ...                   expected_status=200
    ${token}=             Set Variable  ${resp.json()}[access_token]
    Set Suite Variable    ${token}

