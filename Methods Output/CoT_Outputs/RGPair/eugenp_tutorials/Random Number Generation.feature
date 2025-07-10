Feature: Random Number Generation
As a user,
I want to generate random numbers within specified limits
So that I can use the generated numbers for various purposes.

Scenario: Generate Random Number
Given that the user specifies a range from <min-limit> to <max-limit>
When the user generates a random number
Then the generated number should be within the specified range

