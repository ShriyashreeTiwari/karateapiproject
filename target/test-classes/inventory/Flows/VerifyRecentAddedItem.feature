Feature: To verify recently added item in the inventory

Background: 
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }
    * def addNewItem = call read("classpath:inventory/CommonFeatures/Inventory.feature")
    * def itemId = uniqueId   
   
Scenario: Verify recent id item added in the inventory
    Given path 'api/inventory/filter'
    And param id = itemId
    When method Get
    Then status 200
    * karate.log('Response:', response)
    * match response.id == itemId