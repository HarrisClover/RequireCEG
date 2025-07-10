Feature: Set X-Frame-Options HTTP Header

  As a web application security manager
  I want to ensure proper clickjacking protection through the X-Frame-Options HTTP header
  So that the application remains secure against clickjacking attacks

  Background:
    Given the application is set up to handle HTTP headers
    And X-Frame-Options header can be configured

  Scenario: Scenario 1: X-Frame-Options header is missing
    Given the X-Frame-Options header is not set
    When a user attempts to access the application
    Then the system should flag a vulnerability alert message 'X-Frame-Options header is missing; the application is susceptible to clickjacking attacks.'

  Scenario: Scenario 2: X-Frame-Options header is set to DENY
    Given the X-Frame-Options header is set to 'DENY'
    When a user attempts to frame the content
    Then the system should restrict all framing and display the message 'Content cannot be displayed in a frame.'

  Scenario: Scenario 3: X-Frame-Options header is set to SAMEORIGIN from external domain
    Given the X-Frame-Options header is set to 'SAMEORIGIN'
    When a user attempts to access the application from an external domain
    Then the system should block the framing attempt with the message 'Framing is not allowed from this domain.'

  Scenario: Scenario 4: X-Frame-Options header is set to SAMEORIGIN from same domain
    Given the X-Frame-Options header is set to 'SAMEORIGIN'
    When a user accesses the application from the same domain
    Then the content should be displayed correctly.
