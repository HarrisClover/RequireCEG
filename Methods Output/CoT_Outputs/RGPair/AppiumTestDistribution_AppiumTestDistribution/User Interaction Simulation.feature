Feature: User Interaction Simulation
  As a system user,
  I want to simulate button clicks and drag-and-drop actions
  So that I can verify the system's responsiveness and functionality during multiple simultaneous operations.

Scenario Outline: Perform button clicks and drag-and-drop actions
  Given that a user has logged into the system
  When the user clicks on button <button1> and button <button2>
  And performs a drag-and-drop operation from <source> to <destination>
  Then the system should execute all actions correctly within the expected time
  And the system should confirm the correct execution of all actions

Examples:
  | button1 | button2 | source | destination |
  | 1       | 2       | Item A | Basket      |
  | 4       | 3       | Item B | Cart        |
  | 1       | 4       | Item C | Cart        |
  | 2       | 3       | Item D | Basket      |

Scenario: Simulate delay between interactions
  Given that a user has logged into the system
  When the user performs a series of button clicks and drag-and-drop actions
  Then the system should execute each action with a delay of 1 second
  And the system should handle multiple actions in parallel without interference
