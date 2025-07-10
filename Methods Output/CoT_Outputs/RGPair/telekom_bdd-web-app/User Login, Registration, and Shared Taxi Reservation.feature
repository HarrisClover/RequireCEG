Feature: User Login, Registration, and Shared Taxi Reservation

  As a user,
  I want to be able to log in, register, and make reservations for shared taxi rides
  So that I can access my account and book a ride when needed

  Scenario Outline: User Login
    Given the user has registered with valid credentials
    When the user logs in with <username> and <password>
    Then the login should be <login-status>

    Examples:
      | username | password | login-status |
      | validUser | validPassword | success |
      | invalidUser | invalidPassword | failure |

  Scenario Outline: User Registration
    Given the user is on the registration page
    When the user enters <username>, <password>, <email>, and <phone>
    Then the registration should be <registration-status>
    And the user should be redirected to the login page

    Examples:
      | username  | password   | email               | phone       | registration-status |
      | newUser   | newPass    | newuser@email.com   | 1234567890  | success             |
      | invalidUser | shortPwd | invalidemail.com    | 12345      | failure             |

  Scenario Outline: Making a Shared Taxi Reservation
    Given the user is logged in
    And the user selects the date <reservation-date>
    And the number of passengers is <num-passengers>
    When the user attempts to make a reservation
    Then the reservation status should be <reservation-status>
    And the ticket price should be updated based on <num-passengers> and <reservation-date>

    Examples:
      | reservation-date | num-passengers | reservation-status | price |
      | 2025-04-10       | 3              | success            | $45   |
      | 2025-04-12       | 5              | success            | $75   |
      | 2025-04-15       | 1              | failure            | N/A   |

  Scenario: No Reservations During Unavailable Times
    Given the user is logged in
    When the user attempts to make a reservation for a time with no available rides
    Then the system should display a "No available offers" message

  Scenario: Handling JavaScript Disabled
    Given the user has JavaScript disabled in their browser
    When the user attempts to access the reservation page
    Then the system should display a fallback message indicating that JavaScript is required

  Scenario: Session Maintenance Across Different Environments
    Given the user has logged in successfully
    When the user switches between different test environments
    Then the session should remain active and consistent behavior should be observed
