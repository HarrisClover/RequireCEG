Feature: Parallel Execution of Sleep Scenarios

As a system administrator,
I want to test the system’s ability to execute multiple scenarios in parallel
So that I can ensure that the system can handle concurrent tasks efficiently.

Scenario Outline: Parallel execution of sleep scenarios

Given the system is in a predefined state
When the system sleeps for <sleep-duration>
Then the system should complete the sleep operation successfully

Examples:
| sleep-duration |
| 1 second |
| 1 second |
| 1 second |
| 1 second |
| 2 seconds |
| 5 seconds |