Feature: Parallel Execution of Sleep Operations
As a system,
I want to execute multiple scenarios in parallel with varying sleep durations
So that I can ensure the system handles concurrent execution without issues

Scenario Outline: Sleep for <sleep-duration> seconds
Given the system is in the predefined state
When the system sleeps for <sleep-duration> seconds
Then the system should finish sleeping after <sleep-duration> seconds
And the system should not experience any side effects from parallel execution

Examples:
| sleep-duration |
| 1              |
| 1              |
| 1              |
| 1              |
| 2              |
| 5              |
