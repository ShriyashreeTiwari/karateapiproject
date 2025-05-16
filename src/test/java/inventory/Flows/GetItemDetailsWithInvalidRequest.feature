Feature: Get item details with invalid request

Background: 
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }

Scenario: Verify Missing id in query parameter
    Given path 'api/inventory/filter'
    When method Get
    Then status 400 
    * karate.log('Response:', response)
    And match response contains 'Not all requirements are met'

Scenario: Request for non existing id
    Given path 'api/inventory/filter'
    And param id = '9999'
    When method Get
    Then status 404
    * karate.log('Response:', response)
    And match response == 'Not Found'

 Scenario: Request for empty id
    Given path 'api/inventory/filter'
    And param id = ''
    When method Get
    Then status 404
    * karate.log('Response:', response)
    And match response == 'Not Found'
       