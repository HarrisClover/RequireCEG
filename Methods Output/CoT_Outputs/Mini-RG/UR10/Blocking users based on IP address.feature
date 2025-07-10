Feature: Blocking users based on IP address
As: A website administrator,
I want to: Block specific users based on IP address,
So that: I can prevent spamming on the website.

Scenario Outline: Block or not block based on IP address on the blocking list.
Given: The system has a list of blocked IP addresses
When: A user with IP address <user-ip> tries to access the website
Then: The user should be <blocked-or-not-blocked>
Examples:
| user-ip | blocked-or-not-blocked |
| 192.168.1.1 | blocked |
| 192.168.1.2 | not blocked |
| 10.0.0.1 | blocked |
| 10.0.0.2 | not blocked |