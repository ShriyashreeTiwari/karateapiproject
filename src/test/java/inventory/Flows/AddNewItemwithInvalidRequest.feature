Feature: Add new item with invalid request body 

Background: 
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }
    * def testData = read("classpath:utils/inventory.csv")
    * def randomIndex = Math.floor(Math.random() * testData.length)
    * def requestBody = testData[randomIndex]

Scenario: Add item with missing 'id' field into the inventory
    Given path '/api/inventory/add'
    * set requestBody.id = null
    And request requestBody
    When method post
    Then status 400
    * karate.log('Response:', response)
    And match response contains 'Not all requirements are met'
