*** Settings ***
Resource                      ../resources/common_api.robot
Suite Setup                   GetSfAccessToken
Suite Teardown                Log    Suite end


*** Test Cases ***
Create Account Using REST API
    [tags]                    api  account  create
    ${account_name}=          Set Variable  Test Account
    Set Suite Variable        ${account_name}

    Create Session            sfapi  ${login_url}  verify=true
    &{headers}=               Create Dictionary  Authorization=Bearer ${token}  Content-Type=application/json
    &{data}=                  Create Dictionary  name=${account_name}
    ${resp}=                  POST On Session  alias=sfapi  url=/services/data/v53.0/sobjects/Account/
    ...                       headers=&{headers}  json=&{data}  timeout=20

    Log                       ${resp.json()}  console=true
    ${account_id}=            Set Variable  ${resp.json()}[id]
    Set Suite Variable        ${account_id}

Verify Account Using REST API
    [tags]                    api  account  verify
    Create Session            sfapi  ${login_url}  verify=true
    &{headers}=               Create Dictionary  Authorization=Bearer ${token}
    ${resp}=                  GET On Session  alias=sfapi  url=/services/data/v53.0/sobjects/Account/${account_id}/
    ...                       headers=&{headers}  timeout=10

    Log                       ${resp.json()}  console=true
    Should Be Equal           ${resp.json()}[Name]  ${account_name}
    Should Be Equal           ${resp.json()}[Id]  ${account_id}

