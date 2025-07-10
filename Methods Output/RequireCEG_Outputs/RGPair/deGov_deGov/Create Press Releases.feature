Feature: Create Press Releases

  As an administrator
  I want to create and manage press releases
  So that I can effectively communicate updates and announcements

  Background:
    Given the administrator is logged into the system
    And the system is ready to create a press release

  Scenario: Scenario 1: Required Fields
    Given the administrator leaves the title empty
    And the administrator leaves the content body empty
    When the administrator clicks the submit button
    Then an error message indicating the missing title should be displayed
    And an error message indicating the missing content body should be displayed

  Scenario: Scenario 2: Successful Submission
    Given the administrator fills in all required fields with valid data
    When the administrator clicks the submit button
    Then the press release should be successfully created
    And the press release should be queued for review if moderation settings require it

  Scenario: Scenario 3: Missing Media Metadata
    Given the administrator attaches media without providing description
    And the administrator attaches media without providing category
    When the administrator clicks the submit button
    Then a focused warning about the missing metadata should be displayed

  Scenario: Scenario 4: Cookie Compliance
    Given the administrator has configured cookie compliance settings
    When the administrator views the press release page
    Then the cookie compliance settings should be enforced

  Scenario: Scenario 5: Immediate Changes on Dashboard
    Given the administrator has existing press releases
    And the administrator selects a press release to edit
    When the administrator makes changes and submits
    Then the changes should reflect in real-time on the dashboard

  Scenario: Scenario 6: Press Release Direct Publication
    Given the title, content body, and publication date fields are filled in
    And the administrator clicks the submit button
    When the administrator has the necessary access level for direct publishing
    Then the press release should be directly published

  Scenario: Scenario 7: Error for Incomplete Fields
    Given the administrator leaves the title, content, and publication date empty
    When the administrator clicks the submit button
    Then an error message should indicate that all fields must be filled

  Scenario Outline: Scenario Outline: Editing Press Releases
    Given the administrator has existing press releases
    And the administrator selects a press release to edit
    When the administrator makes changes and submits
    Then the changes should reflect in real-time on the dashboard
    Examples:
      | press release | change type | status |
      | Press Release 1 | edit title | updated |
      | Press Release 2 | delete content | updated |
      | Press Release 3 | edit media | updated |

