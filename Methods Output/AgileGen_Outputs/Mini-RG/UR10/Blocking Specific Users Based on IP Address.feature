Feature: Blocking Specific Users Based on IP Address
  As a system administrator,
  I want to block specific users based on their IP address,
  So that I can prevent spamming on the website.

Scenario Outline: Block a user based on IP address
  Given the user’s IP address is <ip-address>
  And the IP address is on the blocking list
  When I attempt to block the user
  Then the user should be blocked
  And the system should prevent further actions from the user

Scenario Outline: Do not block a user if IP address is not on the blocking list
  Given the user’s IP address is <ip-address>
  And the IP address is not on the blocking list
  When I attempt to block the user
  Then the user should not be blocked
  And the system should allow further actions from the user

Examples:
  | ip-address     |
  | 192.168.1.10   |
  | 10.0.0.5       |
  | 172.16.0.4     |
