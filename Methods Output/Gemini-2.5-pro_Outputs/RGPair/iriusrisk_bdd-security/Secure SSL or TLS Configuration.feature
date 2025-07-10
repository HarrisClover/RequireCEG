Feature: Secure SSL or TLS Configuration
  As a System Administrator,
  I want the server's SSL/TLS configuration to be hardened
  So that communication is encrypted using strong, modern standards.

  Scenario: Disable Weak SSL/TLS Protocols
    Given the web server is configured to serve HTTPS traffic
    When a client attempts to connect using weak protocols (e.g., SSLv2, SSLv3, TLSv1.0, TLSv1.1)
    Then the connection attempt must be refused by the server.

  Scenario: Enable Strong TLS Versions and Cipher Suites
    Given the web server is configured to serve HTTPS traffic
    When a client attempts to connect using strong protocols (e.g., TLSv1.2, TLSv1.3)
    Then the connection must be successfully established using a strong cipher suite.

  Scenario: Ensure Perfect Forward Secrecy (PFS) Support
    Given the web server is configured to serve HTTPS traffic
    When a client establishes an HTTPS connection
    Then the negotiated cipher suite must support Perfect Forward Secrecy (PFS) (e.g., using DHE or ECDHE key exchange).