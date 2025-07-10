Feature: Voting System Management
  As an election organizer,
  I want to manage the creation of candidates, voting, and ballot statuses,
  So that I can efficiently handle elections, vote counts, and resolve ties.

Scenario Outline: Candidate Registration and Voting
  Given the system allows the creation of candidates with a unique identifier, name, and registration date
  When a user registers a new candidate with the name <candidate-name> and identifier <candidate-id>
  Then the candidate <candidate-name> should be created successfully with ID <candidate-id>
  And the system should record the registration date for <candidate-name>

Scenario Outline: Voting in an Open Ballot
  Given the ballot is open
  When a user votes for candidate <candidate-name>
  Then the vote count for <candidate-name> should be incremented by 1
  And the system should allow voting until the ballot is closed

Scenario Outline: Attempt to Vote in a Closed Ballot
  Given the ballot is closed
  When a user attempts to vote for candidate <candidate-name>
  Then the system should prevent voting in a closed ballot
  And display the message "Voting is not allowed in a closed ballot."

Scenario Outline: Requesting Results from a Closed Ballot
  Given the ballot is closed
  When a user requests the results of the ballot
  Then the system should display the vote counts and percentages for each candidate

Scenario Outline: Ballot Result with No Votes
  Given the ballot is closed
  And no votes have been cast
  When a user requests the results of the ballot
  Then the system should display a message indicating "No votes were cast."

Scenario Outline: Second Round of Voting Based on Results
  Given that no candidate has received over 50% of the votes in the first round
  And the second round is required
  When the system initiates a second round of voting
  Then the candidates should be able to compete again
  And the system should track vote counts in both rounds to determine the winner

Scenario Outline: Resolving Ties in Voting Results
  Given there is a tie in the voting results
  When the system identifies a tie between candidates <candidate-1> and <candidate-2>
  Then the system should resolve the tie by comparing their registration dates
  And declare the winner as the candidate with the earlier registration date

Scenario Outline: Handling Error Scenarios
  Given the ballot is closed
  When a user attempts to obtain results from an incomplete ballot
  Then the system should display an error message "Results cannot be obtained from an incomplete ballot."
