Feature: Block specific users based on IP address
  As a website administrator
  I want to block specific users based on IP address
  So that I can prevent spamming on the website

  Scenario: User with IP on the blocking list is blocked
    Given a user whose IP address is in the blocking list
    When the user attempts to access the website
    Then the user should be blocked from accessing the website

  Scenario: User with IP not on the blocking list is allowed
    Given a user whose IP address is not in the blocking list
    When the user attempts to access the website
    Then the user should be granted access to the website
