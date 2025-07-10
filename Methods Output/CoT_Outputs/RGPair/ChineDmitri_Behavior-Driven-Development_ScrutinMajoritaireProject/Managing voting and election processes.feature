Feature: Managing voting and election processes
As an election system administrator,
I want to manage candidates, votes, and ballot statuses,
So that I can conduct elections and determine winners in an orderly manner.

Scenario Outline: Candidate creation and voting process
Given that a candidate with the name <candidate-name> is created with ID <candidate-id> and registration date <registration-date>
When a user votes for <candidate-name>
Then the vote count for <candidate-name> should be <vote-count>
And the total number of votes should be <total-votes>

Examples: | candidate-name | candidate-id | registration-date | vote-count | total-votes | | John Doe | 1 | 2025-04-09 | 10 | 50 | | Jane Smith | 2 | 2025-04-01 | 40 | 50 |

Scenario Outline: Ballot closure and result display
Given that the ballot is <ballot-status>
When the results are requested
Then the results should show the vote count for each candidate
And the result percentages should be calculated correctly
And if the ballot is closed, no further votes can be recorded

Examples: | ballot-status | candidate-name | candidate-id | vote-count | total-votes | | closed | John Doe | 1 | 10 | 50 | | closed | Jane Smith | 2 | 40 | 50 |

Scenario Outline: Second round voting requirement
Given that no candidate has received over 50% of the votes
When the first round results are displayed
Then a second round of voting should be triggered
And only candidates who received the highest vote counts should proceed to the second round

Examples: | candidate-name | vote-count | total-votes | is-second-round-required | | John Doe | 30 | 100 | Yes | | Jane Smith | 30 | 100 | Yes |

Scenario: Handling ties in vote count
Given that there is a tie in vote counts between <candidate-name-1> and <candidate-name-2>
When the result is checked
Then the candidate with the earlier registration date should be declared the winner
And the tie-breaking rule should be applied accordingly

Examples: | candidate-name-1 | candidate-id-1 | registration-date-1 | candidate-name-2 | candidate-id-2 | registration-date-2 | | John Doe | 1 | 2025-04-09 | Jane Smith | 2 | 2025-04-01 |

Scenario: Error handling for closed ballots
Given that the ballot is closed
When a user attempts to vote
Then the system should display an error message indicating that voting is no longer allowed

Scenario: Error handling for requesting results from an open ballot
Given that the ballot is open
When the results are requested
Then the system should display an error message indicating that results cannot be shown until the ballot is closed

