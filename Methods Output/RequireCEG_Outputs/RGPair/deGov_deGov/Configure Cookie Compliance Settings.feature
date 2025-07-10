Feature: Configure Cookie Compliance Settings

  As an administrator
  I want to ensure cookie compliance settings are configured
  So that the platform adheres to legal requirements and protects user privacy

  Background:
    Given the cookie compliance settings are not configured
    And the administrator is logged into the system

  Scenario: Scenario 1: Alert if settings are not configured
    Given the cookie compliance settings are not configured
    When the administrator accesses the system
    Then an alert should be displayed indicating the need for configuration

  Scenario: Scenario 2: Access for privileged admin
    Given the cookie compliance settings are configured
    And the user is a privileged administrator
    When the administrator accesses the cookie compliance settings interface
    Then the admin interface should enable options to edit cookie compliance preferences

  Scenario: Scenario 3: Apply changes immediately
    Given the administrator saves changes to cookie compliance settings
    When the settings are saved
    Then the new settings should be immediately applied for all users

  Scenario Outline: Scenario Outline: User action on cookie policy
    Given the user has accepted the cookie policy
    When the user interacts with the platform
    Then a confirmation message should be displayed
    And the corresponding cookie data should be stored
    Examples:
      | user action | policy acceptance | confirmation |
      | accept | true | confirmation displayed |
      | reject | false | no non-essential cookies placed |


  Scenario: Scenario 4: Deletion of non-essential cookies
    Given the compliance settings specify a retention period for user data
    When the retention period has been exceeded
    Then any non-essential cookies that exceed this period should be automatically deleted

  Scenario: Scenario 5: Alert when cookie settings are not configured
    Given the cookie compliance settings are not configured
    When the administrator accesses the platform
    Then an alert should be displayed indicating the need for configuration

  Scenario: Scenario 6: Ensure no cookies placed upon rejection
    Given the user rejects the cookie policy
    When the user interacts with the platform
    Then no non-essential cookies should be placed on the user's device

  Scenario: Scenario 7: Delete non-essential cookies upon retention violation
    Given the non-essential cookies exceed the specified retention period
    When the retention period expires
    Then automatically delete the non-essential cookies

  Scenario: Scenario 8: Confirmation upon acceptance of cookie policy
    Given the user accepts the cookie policy
    When the user interacts with the platform
    Then a confirmation message should be displayed
    And the corresponding cookie data should be stored
