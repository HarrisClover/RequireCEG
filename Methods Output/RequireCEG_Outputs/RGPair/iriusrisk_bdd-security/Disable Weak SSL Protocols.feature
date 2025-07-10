Feature: Disable Weak SSL Protocols

  As a system administrator
  I want to ensure only strong SSL protocols are used
  So that the system maintains secure connections and protects sensitive data

  Background:
    Given the application is set to monitor SSL connections
    And the user is attempting to connect to the system

  Scenario: Scenario 1: Outdated SSL Protocol Detection
    Given the user tries to connect using an outdated SSL protocol
    Then a warning message is displayed stating that the connection is insecure

  Scenario: Scenario 2: Weak SSL Protocol Denial
    Given the user attempts to connect using a weak SSL protocol
    Then access is automatically denied
    And a prompt is displayed advising the user to switch to a strong protocol

  Scenario: Scenario 3: Validating TLS Version
    Given the user connects using TLS 1.2 or higher
    And the cipher suite used for the connection supports perfect forward secrecy
    Then confidential data can be transmitted securely

  Scenario: Scenario 4: SSL Configuration Compliance
    Given the system has an SSL configuration that adheres to established security standards
    When the user attempts to transmit sensitive data
    Then the data is transmitted securely
    And data confidentiality is upheld

  Scenario: Scenario 5: TLS Not Compliant Scenario
    Given the user tries to connect using SSL 3.0
    Then the connection is denied
    And a warning message is displayed stating that the connection is insecure
