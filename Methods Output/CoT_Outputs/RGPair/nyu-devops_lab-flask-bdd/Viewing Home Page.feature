Feature: Viewing Home Page
  As a Pet Store Owner
  I want to see a functional home page with the title "Pet Demo RESTful Service"
  So that I can confirm that the system is working correctly

  Scenario: The home page loads correctly
    Given the system is online
    When I navigate to the home page
    Then the title should be "Pet Demo RESTful Service"
    And no "404 Not Found" error should be displayed

