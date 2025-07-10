Feature: Create Normal Pages

  As an administrator user
  I want to create normal pages in the content management interface
  So that I can provide necessary content for users to access.

  Background:
    Given the administrator is logged into the content management system
    And the administrator is on the content management interface

  Scenario: Scenario 1: Creating a Normal Page without mandatory fields
    Given the 'Create Normal Page' button is visible
    When the administrator clicks the 'Create Normal Page' button
    Then the system displays mandatory fields for 'title' and 'content body'
    And the administrator attempts to save the page without entering any mandatory fields
    Then the system presents an error message indicating the specific fields that must be completed

  Scenario: Scenario 2: Successfully Creating a Normal Page
    Given the mandatory fields 'title' and 'content body' are filled out
    When the administrator clicks the 'Save' button
    Then a confirmation message appears notifying the administrator of successful creation
    And the new page is listed in the content index for accessibility

  Scenario: Scenario 3: Storing Optional Metadata
    Given the administrator has filled out mandatory fields for creation
    And the administrator chooses to add optional metadata such as 'author name' or 'publication date'
    When the administrator saves the page
    Then the optional metadata is stored alongside the normal page for future retrieval

  Scenario: Scenario 4: Verifying a Normal Page
    Given a normal page has been successfully created
    When other authorized users access the content management system
    Then they can review the created normal page to ensure the quality and accuracy of the published content

  Scenario: Scenario 5: Activating the Save Button
    Given the administrator fills out all required fields
    And the administrator clicks the 'Save' button
    Then the 'Save' button is activated

  Scenario: Scenario 6: Mandatory Fields Not Filled
    Given the 'Create Normal Page' button is visible
    When the administrator clicks the 'Create Normal Page' button
    And the administrator does not fill out the 'title' or 'content body'
    Then the system displays mandatory fields for 'title' and 'content body'

  Scenario Outline: Scenario Outline: Adding Optional Metadata
    Given the administrator has filled out mandatory fields for creation
    And the administrator decides to add optional metadata like <metadata>
    When the administrator saves the page
    Then the optional metadata is stored alongside the normal page for future retrieval
    Examples:
      | metadata |
      | author name |
      | publication date |
      | author name and publication date |

