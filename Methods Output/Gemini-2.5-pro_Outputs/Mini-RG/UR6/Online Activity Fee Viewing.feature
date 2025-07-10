Feature: Online Activity Fee Viewing
  As a User,
  I want to view available activity fees online,
  So that I can easily create a bill statement or simply check the fees.

  Scenario: Successfully viewing all available activity fees online
    Given the user is logged in
    And the following activity fees exist in the system:
      | Activity Name        | Fee Amount |
      | Gym Access           | $50.00     |
      | Swimming Pool Entry  | $15.00     |
      | Tennis Court Booking | $25.00     |
    And the network connection is stable
    When the user navigates to the activity fees section
    Then the user should see all the listed activity fees:
      | Activity Name        | Fee Amount |
      | Gym Access           | $50.00     |
      | Swimming Pool Entry  | $15.00     |
      | Tennis Court Booking | $25.00     |

  Scenario: Attempting to view activity fees when none are available
    Given the user is logged in
    And there are no activity fees configured in the system
    And the network connection is stable
    When the user navigates to the activity fees section
    Then a message indicating "No activity fees available" should be displayed
    And the activity fees list should be empty

  Scenario: Attempting to view activity fees with network issues
    Given the user is logged in
    And activity fees exist in the system
    And the network connection is down or unstable
    When the user attempts to navigate to the activity fees section
    Then an appropriate error message regarding network connectivity should be displayed
    And the activity fees list should not be displayed