Feature: Repetitive Sleep Scenario for One Second

  As a system administrator
  I want the system to handle sleep commands efficiently
  So that I can ensure smooth operations even with multiple concurrent requests

  Background:
    Given the system is operational
    And it supports commands to initiate sleep

  Scenario: Scenario 1: Single Sleep Command
    Given a single sleep command is triggered
    When the system executes the sleep command
    Then the system enters a sleep state for one second
    And the system resumes normal operations after the pause

  Scenario: Scenario 2: Multiple Concurrent Sleep Commands
    Given four sleep commands are triggered simultaneously
    When the system manages the sleep requests in parallel
    Then the system engages in four separate sleep states
    And the total sleep duration reflects the concurrent requests, amounting to four seconds before returning to full operation

  Scenario: Scenario 3: System Resumes Operations Correctly
    Given multiple sleep commands are executed
    When the system resumes normal operations post sleep
    Then the system does not exceed expected sleep duration due to overlapping requests

  Scenario Outline: Scenario Outline: Varying Sleep Command Execution
    Given the system receives <number> sleep commands
    And the sleep duration is always one second
    When the system processes these commands
    Then the total sleep time equals <total-sleep-time> seconds
    Examples:
      | number | total-sleep-time |
      | 1 | 1 |
      | 2 | 2 |
      | 3 | 3 |
      | 4 | 4 |
      | 5 | 5 |

