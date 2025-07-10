Feature: Support Strong Ciphers

  As a system administrator
  I want to ensure the use of strong TLS protocols and ciphers
  So that the connections to the system are secure and protect data integrity

  Background:
    Given the system requires connections to utilize TLS 1.2 or higher
    And the system must reject any connections attempting to use weak ciphers or compromised TLS versions

  Scenario: Scenario 1: Weak Cipher Detected
    Given a client attempts to connect using RC4
    Then the connection is rejected
    And the message 'Connection rejected: weak cipher detected.' is printed

  Scenario: Scenario 2: Unsupported TLS Version
    Given a client attempts to connect using TLS 1.0
    Then the server responds with an error message
    And 'Error: Unsupported TLS version.' is displayed

  Scenario: Scenario 3: Successful Connection with Strong Cipher and Supported TLS Version
    Given a client attempts to connect using TLS 1.3
    And the connection uses AES-256-GCM cipher
    When the connection is established
    Then the connection is secured
    And perfect forward secrecy is enabled

  Scenario: Scenario 4: Reject Connection Due to Weak Cipher
    Given a client attempts to connect using a weak cipher
    Then the connection is rejected
    And the message 'Connection rejected: weak cipher detected.' is printed

  Scenario: Scenario 5: Connection with Strong TLS Protocols and Ciphers
    Given the connection uses strong TLS protocols and ciphers
    Then the connection is successfully established
    And the message 'Connection established securely.' is printed
