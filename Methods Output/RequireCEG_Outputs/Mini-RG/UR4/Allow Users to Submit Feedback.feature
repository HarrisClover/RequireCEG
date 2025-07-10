Feature: Allow Users to Submit Feedback

  As a user
  I want to provide feedback regarding the user documentation
  So that my input can help improve the documentation

  Background:
    Given the user documentation is available
    And the user is logged into the system

  Scenario: Submit Positive Feedback
    Given the user provides positive feedback
    When the user submits the feedback
    Then the system should respond with a thank-you message
    And indicate appreciation for the user's input

  Scenario: Submit Negative Feedback
    Given the user provides negative feedback
    When the user submits the feedback
    Then the system should prompt the user for more detailed information
    And facilitate improvements based on the feedback

  Scenario: User Documentation Not Available
    Given the user documentation is not available
    When the user attempts to submit feedback
    Then the feedback submission option should be disabled
    And the system should display a message informing the user that documentation is currently unavailable for feedback

  Scenario: User Documentation Is Down
    Given the user documentation page is down
    When the user attempts to submit feedback
    Then the feedback submission option should be disabled
    And the system should display a message indicating the documentation is currently unavailable

  Scenario Outline: Scenario Outline: Feedback Submission Based on Documentation State
    Given the documentation status is <documentation-status>
    When the user attempts to provide feedback
    Then the system should <feedback-outcome>
    Examples:
      | documentation-status | feedback-outcome |
      | available | allow feedback submission |
      | not available | disable feedback submission |
      | down | disable feedback submission |

