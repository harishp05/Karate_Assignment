Feature: User validate pet creation E2E

  # Read data from Excel
  Background:
    * def java_file = Java.type('Kar_Problem1.Reusable')
    * def result = java_file.read_Properties_File('createpet_api')

  # PET ID creation
  Scenario Outline: user validate POST call pet id
    * def txt_Pet_ID = java_file.read_Excel("<TC_ID>",'petid')
    * def txt_Pet_name = java_file.read_Excel("<TC_ID>",'petname')
    * def body = java_file.creatPait_Req_Body(txt_Pet_ID,txt_Pet_name)
    Given url result
    And header Content-type = 'application/json; charset=utf-8'
    When request body
    When method POST
    Then status 200
    And match responseType =='json'
    And print response
    And assert response.id == txt_Pet_ID
    And assert response.name == txt_Pet_name
    And assert response.status == 'Active'
    # GET PET ID
    * def Pet_ID_ = java_file.flottoint(txt_Pet_ID)
    Given url 'https://petstore.swagger.io/v2/pet/'+Pet_ID_
    When method GET
    Then status 200
    And match responseType =='json'
    And print response
    And assert response.id == txt_Pet_ID
    And assert response.name == txt_Pet_name
    And assert response.status == 'Active'
    # Delete PET ID
    Given url 'https://petstore.swagger.io/v2/pet/'+Pet_ID_
    When method DELETE
    Then status 200
    And match responseType =='json'
    And print response
    And assert response.code== 200
    And assert response.message == Pet_ID_

    Examples:
      |TC_ID|
      |TC001|
      |TC002|
      |TC003|
      |TC004|
      |TC005|
      |TC006|
      |TC007|
      |TC008|
      |TC009|
      |TC010|
      |TC011|
      |TC012|
      |TC013|
      |TC014|
      |TC015|
      |TC016|
      |TC017|
      |TC018|
      |TC019|
      |TC020|
      |TC021|
      |TC022|
      |TC023|
      |TC024|
      |TC025|
      |TC026|
      |TC027|
      |TC028|
      |TC029|
      |TC030|
