Feature: Get an inventory list

Background: 
  * url baseUrl
  * configure headers = { 'Content-Type':'application/json', 'accept': 'application/json' }
  * def itemSchema = read("classpath:resources/InventorySchema.json")

Scenario: fetch inventory list
  Given path '/api/inventory'
  When method Get
  Then status 200
  * karate.log('Response:', response)
  * def itemCount = response.data.length
  And assert itemCount >= 9
  And match each response.data[*] == itemSchema
 