Feature: Generate Company Performance Reports

  As a user with defined access privileges
  I want to generate company performance reports
  So that I can analyze data based on my access rights

  Background:
    Given the system defines user access privileges
    And company data has various restrictions

  Scenario: Scenario 1: Full Access Privileges with No Restrictions
    Given a user with full access privileges
    And company data has no restrictions
    When the user attempts to generate a report
    Then the report should be generated
    And the message should say 'Report Generated'

  Scenario: Scenario 2: Full Access Privileges with Restrictions
    Given a user with full access privileges
    And company data has some restrictions
    When the user attempts to generate a report
    Then the report should be generated
    And the message should say 'Report Generated'

  Scenario: Scenario 3: Limited Access Privileges with No Restrictions
    Given a user without full access privileges
    And company data has no restrictions
    When the user attempts to generate a report
    Then the report generation should be denied
    And the message should say 'Access Denied'

  Scenario: Scenario 4: Limited Access Privileges with Restrictions
    Given a user without full access privileges
    And company data has some restrictions
    When the user attempts to generate a report
    Then the report generation should be denied
    And the message should say 'Access Denied'

  Scenario: Scenario 5: Limited Access Privileges with Correct Access Level
    Given a user with limited access privileges
    And company data has some restrictions
    When the user attempts to generate a report with correct access privileges
    Then the report should be generated
    And the message should say 'Report Generated despite restricted access privileges due to unrestricted company data.'

  Scenario: Scenario 6: Limited Access Privileges without Correct Access Level
    Given a user with limited access privileges
    And company data has some restrictions
    When the user attempts to generate a report with incorrect access privileges
    Then the report generation should be denied
    And the message should say 'Access Denied'
