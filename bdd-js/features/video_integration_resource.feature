@core
Feature: Video Integration REST API
  We can start a call using rest api


  Scenario:start call with a patient
    Given I use contents of json file ./features/fixtures/start_call_body.json
    When I do POST to url /services/videoconf/rest/integration/startCall
    Then response body should contain "topic"


