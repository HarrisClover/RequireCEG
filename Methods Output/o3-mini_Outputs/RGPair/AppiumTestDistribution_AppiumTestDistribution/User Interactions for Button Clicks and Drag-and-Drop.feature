Feature: User Interactions for Button Clicks and Drag-and-Drop

  # This feature verifies that after a successful login,
  # users can perform multiple interactions such as button clicks and drag-and-drop operations,
  # with intentional delays to simulate parallel scenario execution.

  Scenario: User logs in and performs button click interactions with delays
    Given the user has logged into the system
    When the user clicks on the numbers as part of their interaction
    And the system introduces a one second delay after the click sequence
    Then the system should accurately record the button clicks without interference

  Scenario Outline: Validate button click sequences with different number combinations
    Given the user is logged into the system
    When the user clicks the number "<first>" and then clicks the number "<second>"
    And the system introduces a one second delay after processing the clicks
    Then the system should register the interaction for the combination "<first>" and "<second>"

    Examples:
      | first | second |
      | 4     | 3      |
      | 1     | 2      |

  Scenario: Confirm drag-and-drop functionality post-interaction
    Given the user is logged into the system
    And the user has completed the button click interactions
    When the user performs a drag-and-drop action
    And the system introduces a one second delay to simulate simultaneous operations
    Then the drag-and-drop functionality should operate correctly and the interaction should be confirmed
