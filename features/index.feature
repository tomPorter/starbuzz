Feature: Home page

  Scenario: Reading the home page for Starbuzz Coffee
    When I go to the home page
    Then I should see "Starbuzz Coffee"
    And there should be hidden text "Beverage#list_static"
