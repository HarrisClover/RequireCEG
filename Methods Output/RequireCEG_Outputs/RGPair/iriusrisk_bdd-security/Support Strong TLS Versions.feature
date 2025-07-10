Feature: Support Strong TLS Versions

  As a system administrator
  I want to ensure all HTTPS connections use TLS 1.2 or higher
  So that the system maintains secure communications and protects user data

  Background:
    Given the system is configured to reject weak TLS protocols
    And perfect forward secrecy is a critical security requirement

  Scenario: Reject weak TLS connections
    Given a client attempts to connect using TLS 1.0
    Then the connection should be rejected
    And an error message should state 'Connection rejected: Please use TLS 1.2 or higher for secure connections.'

  Scenario: Log weak cipher suite connection attempts
    Given a client attempts to connect with a weak cipher suite
    Then the connection should be refused
    And the incident should be logged with the message 'Weak cipher suite negotiation failed: Connection refused.'

  Scenario: Alert on missing perfect forward secrecy
    Given the SSL settings lack perfect forward secrecy configuration
    Then an immediate alert should be issued to the security team
    And the alert message should be 'Alert: Perfect forward secrecy is not enabled; immediate remediation required.'

  Scenario: Reject connections when strong cipher suite is not negotiated
    Given a client attempts to connect with TLS 1.2
    And a weak cipher suite is negotiated
    Then the connection should be refused
    And the incident should be logged with the message 'Weak cipher suite negotiation failed: Connection refused.'

  Scenario: Ensure TLS 1.2 or higher is a requirement for connections
    Given a client attempts to connect using TLS 1.0
    Then the connection should be rejected
    And an error message should state 'Connection rejected: Please use TLS 1.2 or higher for secure connections.'

  Scenario Outline: Scenario Outline: Test TLS connection requirements
    Given the client is attempting to connect using <tls-version>
    And the cipher suite being used is <cipher-suite>
    When the connection is established
    Then the connection should <result>
    Examples:
      | tls-version | cipher-suite | result |
      | TLS 1.2 | StrongCipherSuite | be accepted |
      | TLS 1.0 | WeakCipherSuite | be rejected |
      | TLS 1.2 | WeakCipherSuite | be rejected |

