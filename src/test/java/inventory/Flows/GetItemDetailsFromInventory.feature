Feature: Get the item details from Inventory list

Background:
    * url baseUrl
    * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }

Scenario: Get an item details
    Given path "api/inventory/filter"
    And param id = 3
    When method Get
    Then status 200
    * karate.log('Response:', response)
    And response.id == '3'
    And response.name == "Baked Rolls x 8"
    And response.image == "roll.png"
    And response.price == "$10"
