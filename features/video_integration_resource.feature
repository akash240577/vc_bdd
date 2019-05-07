Feature: Video Integration REST API
  We can start a call using rest api

  Scenario: start call with a patient
    Given a request url http://localhost:8080/services/videoconf/rest/integration/startCall
    And a request json payload
      """
      {"mrn":"GWN1554742612855511",
        "conferenceNode":"https://10.28.3.28/webapp",
        "conferenceAlias":"alias-1",
        "pin":"12xyz",
        "callerName":"Akash",
        "message":"Rajput"
      }
      """
    When the request sends POST
    Then the response status is OK

    And the response json at $.topic is not null

  Scenario: check call initiation status for empty topic
    Given a request url http://localhost:8080/services/videoconf/rest/integration/callInitiationStatus
    And a request json payload
      """
      {"topic":""}
      """
    When the request sends POST
    Then the response status is BAD_REQUEST

  Scenario: check call initiation status for non existing topic i.e. when no call was started
    Given a request url http://localhost:8080/services/videoconf/rest/integration/callInitiationStatus
    And a request json payload
      """
      {"topic":"non-existing"}
      """
    When the request sends POST
    Then the response status is OK
    Then the response json at $.errors[0].code is equal to 'PLS-VC-016'
    Then the response json at $.errors[0].description is equal to 'No call with given topic was found or call was cancelled or timed out'



