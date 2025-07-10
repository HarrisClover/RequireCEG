Feature: Customizable User Interface Options

  As a user
  I want to personalize my Todo list interface
  So that I can have a visually appealing and user-friendly experience

  Background:
    Given the user has logged into the application
    And the default interface settings are applied

  Scenario: Scenario 1: Changing Theme
    Given the user selects a custom theme
    When the theme is applied
    Then the Todo list updates to reflect the chosen color scheme and font styles
    And the visual experience remains cohesive

  Scenario: Scenario 2: Rearranging Todo Items
    Given the user is viewing their Todo list
    When the user drags and drops items to rearrange them
    Then the Todo items are reordered according to the user's modifications

  Scenario: Scenario 3: Enabling Notifications
    Given the user opts to enable notifications
    When the confirmation prompt is displayed
    Then the user can confirm their selection before changes take effect

  Scenario: Scenario 4: Changing Font Size
    Given the user requests a change in font size
    When the new font size is applied
    Then the entire Todo list resizes accordingly

  Scenario: Scenario 5: Saving Preferences
    Given the user has made customizations to their preferences
    When the user chooses to save their preferences
    Then the customizations are stored in the database
    And the settings persist across user sessions

  Scenario: Scenario 6: Required Action for Saving Preferences
    Given the user selects a custom theme
    And the user chooses to save their preferences
    When the user opts to save their settings
    Then the Todo list updates and the customizations are stored in the database

  Scenario Outline: Scenario Outline: Theme Selection Impact
    Given the user selects a customized theme <theme>
    And the font styles preference is <font-style>
    When the user applies these selections
    Then the Todo list reflects the <theme> and <font-style>
    Examples:
      | theme | font-style |
      | Dark Mode | Arial |
      | Light Mode | Times New Roman |
      | Blue Theme | Helvetica |

