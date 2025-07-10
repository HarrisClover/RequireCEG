Feature: Provide Essential Buttons for Interactions

  As an administrator
  I want to access essential action buttons for content management
  So that I can manage media, terms, pages, and press releases efficiently

  Background:
    Given the administrator is logged into the system
    And the administrator has the necessary permissions

  Scenario: Scenario 1: Accessing the Media Management Feature
    Given the administrator is on the content management interface
    When the administrator clicks 'Add Media'
    Then the system presents a media type selection form
    And the administrator can enter metadata details

  Scenario: Scenario 2: Accessing the Term Management Feature
    Given the administrator is on the content management interface
    When the administrator clicks 'Add Term'
    Then the system displays an input field for entering the term
    And the term is saved within the selected taxonomy

  Scenario: Scenario 3: Creating a Content Page
    Given the administrator is on the content management interface
    When the administrator clicks 'Create Page'
    Then the system provides a text editor interface for title and content
    And the page is saved when all fields are validated

  Scenario: Scenario 4: Creating a Press Release
    Given the administrator is on the content management interface
    When the administrator clicks 'Create Press Release'
    Then the system displays options for entering press release content
    And the press release is saved when all fields are validated

  Scenario: Scenario 5: Permissions to Access Features
    Given the administrator is on the content management interface
    When the administrator clicks 'Add Media'
    Then the system generates an error message indicating insufficient permissions
    And the administrator cannot add media

  Scenario Outline: Scenario Outline: Insufficient Permissions for Action
    Given the administrator does not have permissions for <action>
    When the administrator attempts to access <action>
    Then the system generates an error message indicating insufficient permissions
    Examples:
      | action |
      | Add Media |
      | Add Term |
      | Create Page |
      | Create Press Release |

