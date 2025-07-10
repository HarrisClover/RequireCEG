Feature: Enable Perfect Forward Secrecy

  As a security administrator
  I want to ensure that the server supports Perfect Forward Secrecy (PFS)
  So that secure connections can be established using strong encryption methods

  Background:
    Given the server's SSL configuration is checked for Perfect Forward Secrecy (PFS)
    And the client's connection is tested for supported TLS versions and cipher suites

  Scenario: Scenario 1: Successful PFS Establishment
    Given a client connects using a supported strong TLS version and a PFS-capable cipher suite
    Then the connection should be established securely using Perfect Forward Secrecy
    And sensitive data transmitted remains protected

  Scenario: Scenario 2: Connection Attempt with Weak Protocols
    Given a client attempts to connect using weak protocols or ciphers
    Then the server should reject the connection attempt
    And present an error message indicating unsupported security settings

  Scenario: Scenario 3: Non-PFS Connection Attempt
    Given a client connects using a strong TLS version but selects a non-PFS cipher suite
    Then the server should reject the connection attempt
    And present an error message indicating unsupported security settings

  Scenario: Scenario 4: Incompatible TLS Version
    Given a client connects using an unsupported TLS version
    Then the server should reject the connection attempt
    And provide an error message indicating unsupported security settings

  Scenario Outline: Scenario Outline: TLS Version and Cipher Suite Check
    Given the client uses a TLS version <tls-version>
    And the client selects a cipher suite <cipher-suite>
    When the server checks for PFS support
    Then the result should be <connection-status>
    Examples:
      | tls-version | cipher-suite | connection-status |
      | TLS 1.2 | RSA-AES256-SHA | established |
      | TLS 1.1 | RSA-AES128-SHA | rejected |
      | TLS 1.3 | CHACHA20-POLY1305 | established |
      | TLS 1.0 | RC4-MD5 | rejected |

