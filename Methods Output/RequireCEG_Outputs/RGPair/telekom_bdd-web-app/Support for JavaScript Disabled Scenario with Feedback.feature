Feature: Support for JavaScript Disabled Scenario with Feedback

  As a user
  I want to be informed when JavaScript is disabled
  So that I can enable it for full functionality of the site

  Background:
    Given that the user has JavaScript disabled in their browser

  Scenario: Attempting to access reservation feature without JavaScript
    Given the user is on the reservation page
    When the user attempts to access the reservation feature
    Then a message should be displayed stating 'JavaScript is required to make reservations. Please enable it for full functionality.'

  Scenario: Logging in without JavaScript
    Given the user is on the login page with JavaScript disabled
    When the user attempts to log in
    Then a fallback message should be displayed prompting the user to enable JavaScript for login.

  Scenario: Registering without JavaScript
    Given the user is on the registration page with JavaScript disabled
    When the user attempts to register
    Then a fallback message should be displayed prompting the user to enable JavaScript to proceed.

  Scenario: Form submission disabled without JavaScript
    Given the user is on a login or registration page with a disabled form
    When the user attempts to submit the form
    Then a notification should display 'Form submission is disabled without JavaScript. Please enable JavaScript to proceed.'

  Scenario Outline: Various features access without JavaScript
    Given the user is on the <page> page
    When the user attempts to <action>
    Then <expectedOutcome>
    Examples:
      | page | action | expectedOutcome |
      | reservation | access the reservation feature | a message stating 'JavaScript is required to make reservations. Please enable it for full functionality.' |
      | login | log in | a prompt to enable JavaScript to access login |
      | registration | register | a prompt to enable JavaScript to access registration |

