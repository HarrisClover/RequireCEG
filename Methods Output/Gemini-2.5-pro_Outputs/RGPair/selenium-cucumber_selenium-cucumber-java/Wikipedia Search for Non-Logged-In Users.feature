Feature: Wikipedia Search for Non-Logged-In Users

  Scenario Outline: Search Wikipedia and Close Browser
    Given the user is not logged in and navigates to the Wikipedia homepage
    When the user selects the language "<language>" from the language dropdown
    And the user enters the search term "<search_term>" into the search input field
    And the user clicks the search button
    Then the search results page for "<search_term>" should be displayed
    # Requirement explicitly mentions waiting and closing
    When the system waits for a brief period (e.g., 2 seconds)
    And the user closes the browser

    Examples:
      | language | search_term      |
      | en       | Software testing |
      | es       | Gherkin language |
      | de       | Behavior-driven development |