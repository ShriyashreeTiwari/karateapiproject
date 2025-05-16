Feature: Add item to inventory

Background: 
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }
    * def testData = read("classpath:utils/inventory.csv")
    # Here we are fetching the first record as we need to run the testcase with particular testdata
    * def requestBody = testData[0]

Scenario: Add new item into the inventory
    * karate.log('Request Body: ', requestBody)
    Given path '/api/inventory/add' 
    And request requestBody
    When method post
    Then status 200
    * karate.log('Response:', response)
    And match response == 'OK'  
    And assert responseTime < 3000 


Scenario: Add the existing item into the inventory
    * karate.log('Request Body: ', requestBody)     
    Given path '/api/inventory/add' 
    And request requestBody
    When method post
    Then status 400
    * karate.log('Response:', response)
    And match response == 'Bad Request'  
    And assert responseTime < 3000
