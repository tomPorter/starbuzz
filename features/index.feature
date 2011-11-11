Feature: Home page

  Scenario: Reading the "hello world" message on the home page
    When I go to the home page
    Then I should see "Starbuzz Coffee"
    And There should be hidden text "Beverage#list_static"
