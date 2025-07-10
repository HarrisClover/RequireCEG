Feature: Notify Users of Significant Changes

  As a system administrator
  I want to notify users about significant changes in the user documentation
  So that users have access to the most current information and updates

  Background:
    Given the user documentation exists
    And significant changes have been made

  Scenario: Scenario 1: User Documentation is Available and Updated
    Given the user documentation has been updated
    When the user visits the main page
    Then the user receives an alert message about the changes
    And the user has an option to review the updates

  Scenario: Scenario 2: User Documentation is Unavailable
    Given there is no user documentation
    When the user attempts to access the documentation
    Then the system displays an error message stating 'User documentation is currently unavailable.'

  Scenario: Scenario 3: User Documentation Page is Down
    Given the user documentation page is down
    When the user tries to access the documentation
    Then the system responds with a message stating 'We are unable to reach the user documentation page at this time. Please try again later.'

  Scenario: Scenario 4: User Documentation is Available but Significant Changes
    Given the user documentation is available
    And significant changes have been made
    When the user accesses the documentation
    Then the user receives an alert message notifying them of the significant changes
    And the user has the option to review the updates

  Scenario: Scenario 5: User Documentation is Inaccessible
    Given the user documentation page is down
    And the documentation should be accessible
    When the user attempts to access the documentation
    Then the system informs the user that documentation is currently inaccessible.
