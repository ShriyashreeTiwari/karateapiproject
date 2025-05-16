Feature: Inventory creation 

Background:
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }
    * def testData = read("classpath:utils/inventory.csv")
    * def randomIndex = Math.floor(Math.random() * testData.length)
    * def requestBody = testData[randomIndex]
    * set requestBody.id = uniqueId


Scenario: Add new item
    * karate.log("Request Body: ", requestBody)
    Given path '/api/inventory/add'
    And request requestBody
    When method post
    Then status 200
    And match response contains "OK"
    

 