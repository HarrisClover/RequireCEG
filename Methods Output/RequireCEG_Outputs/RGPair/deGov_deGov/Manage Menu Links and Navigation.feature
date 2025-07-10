Feature: Manage Menu Links and Navigation

  As an administrator
  I want to manage menu links in the system
  So that I can update, add, or delete links effectively for navigation

  Background:
    Given the administrator is logged into the system
    And the administrator has access to manage menu links

  Scenario: Scenario 1: Add a new menu link
    Given the administrator decides to add a new menu link
    And the administrator enters a valid link URL and link text
    When the administrator submits the new menu link
    Then the system should validate the entries
    And a success message should be displayed confirming the addition

  Scenario: Scenario 2: Edit an existing menu link
    Given the administrator selects an existing menu link to edit
    And the administrator changes the URL or text of the existing menu link
    When the administrator submits the modified menu link
    Then the system should verify the updated entries
    And a confirmation message should indicate the successful modification

  Scenario: Scenario 3: Delete a menu link
    Given the administrator selects a menu link to delete
    When the administrator confirms the deletion of the selected menu link
    Then the system should trigger a warning prompt for confirmation
    And the link should be removed from the database after confirmation

  Scenario: Scenario 4: Validate Required Fields
    Given the administrator is making modifications to the menu links
    When the administrator attempts to save the changes without completing required fields
    Then the system should display an error message indicating that required fields are missing

  Scenario Outline: Scenario Outline: Saving menu link changes
    Given the administrator is making modifications to the menu links
    And all required fields are completed <completed>
    When the administrator saves the changes
    Then the changes should be applied to the navigation menu
    Examples:
      | completed | outcome |
      | true | The changes are saved successfully and reflected in the navigation menu |
      | false | An error message is displayed indicating that required fields are missing |

