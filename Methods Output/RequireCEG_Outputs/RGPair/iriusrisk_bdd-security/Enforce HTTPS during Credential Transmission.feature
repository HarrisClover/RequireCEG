Feature: Enforce HTTPS during Credential Transmission

  As a user
  I want to ensure that my credential data is securely transmitted over HTTPS
  So that my sensitive information remains protected from unauthorized access

  Background:
    Given the user attempts to submit credentials
    And the connection is established over a secure HTTPS protocol

  Scenario: Submitting credentials over HTTP
    Given the user is on the login page
    And the user enters valid credentials
    When the user submits the credentials over a non-secure connection (HTTP)
    Then an error message is displayed indicating that a secure connection is mandatory
    And the user remains on the login page

  Scenario: Accessing sensitive areas over HTTP
    Given the user is logged in over a secure connection (HTTPS)
    When the user attempts to access a sensitive area via a non-secure connection (HTTP)
    Then the system blocks access
    And the user is redirected to a secure HTTPS page

  Scenario: Automatic logout after inactivity
    Given the user is logged in over HTTPS
    And the user has been inactive for the predefined duration
    When the time limit is reached
    Then the system automatically logs out the user

  Scenario: Session security enforcement
    Given the user is logged in over HTTPS
    And the user remains inactive for a predefined duration
    When the system detects inactivity
    Then the system automatically logs out the user

  Scenario: Secure connection enforcement on accessing sensitive pages
    Given the user attempts to access a sensitive area
    When the connection is not established over a secure HTTPS protocol
    Then the user is blocked from accessing the page
    And the user is redirected to a secure HTTPS page

  Scenario Outline: Scenario Outline: Login Attempts with Various Connection Types
    Given the user is on the login page
    And the user enters valid credentials
    When the user submits the credentials over <connection_type>
    Then <expected_outcome>
    Examples:
      | connection_type | expected_outcome |
      | HTTP | an error message is displayed indicating that a secure connection is mandatory |
      | HTTPS | the system allows the user to log in |

