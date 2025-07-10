Feature: Voting System for Candidates

As a system user,
I want to register candidates, vote for them, and manage open/closed ballots,
So that the election process runs smoothly with proper handling of voting statuses, results, and ties.

Scenario 1: Register candidates
Given that a candidate is being registered
When a user provides a unique identifier, name, and registration date
Then the system should create a candidate with a unique identifier, name, and registration date

Scenario 2: Voting for candidates
Given that a ballot is open for voting
And a user is logged into the system
When the user casts a vote for a candidate
Then the vote count for the chosen candidate should be incremented by 1

Scenario 3: Closing a ballot
Given that a ballot is open
When the system closes the ballot
Then no further votes can be cast
And the system should mark the ballot as closed

Scenario 4: Checking if a ballot is closed
Given that a user wants to check if a ballot is closed
When the user queries the status of the ballot
Then the system should return the current status of the ballot (open or closed)

Scenario 5: Displaying results after ballot closure
Given that a ballot is closed
When a user requests the results
Then the system should display the vote counts for each candidate
And the system should calculate and display the percentage of votes each candidate received

Scenario 6: Second round of voting if no candidate wins
Given that a ballot is closed
And no candidate received more than 50% of the votes
When the system detects that no candidate has a majority
Then the system should initiate a second round of voting with the remaining candidates

Scenario 7: Handling ties
Given that two or more candidates have the same number of votes
When the system detects a tie
Then the system should resolve the tie by comparing the candidates' registration dates
And the candidate with the earlier registration date should be declared the winner

Scenario 8: Attempting to vote in a closed ballot
Given that a ballot is closed
When a user attempts to vote in the closed ballot
Then the system should display an error message indicating that voting is not allowed in a closed ballot

Scenario 9: Requesting results from an open ballot
Given that a ballot is open
When a user requests the results
Then the system should display an error message indicating that the ballot is still open and results cannot be obtained

Scenario 10: No votes recorded in a ballot
Given that a ballot is closed
And no votes were recorded for any candidate
When the user requests the results
Then the system should display a message indicating that no votes were cast in the ballot