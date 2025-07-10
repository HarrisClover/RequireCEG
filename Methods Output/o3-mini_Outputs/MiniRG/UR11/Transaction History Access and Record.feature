Feature: Transaction History Access and Record
  As a system user with varying levels of permission,
  I want to check the transaction history and optionally keep a record of it,
  So that I can review past transactions when needed while ensuring access control based on my permission level.

  # Scenario: User with permission to both check and keep transaction history
  Scenario: User with full permission checks and records transaction history
    Given the user has permission to "check transaction history" and permission to "keep record"
    When the user requests to view the transaction history
    Then the system displays the transaction history
    And the system records the transaction history for audit purposes

  # Scenario: User with permission to only check transaction history (recording not allowed)
  Scenario: User with check-only permission views transaction history without recording
    Given the user has permission to "check transaction history" but not permission to "keep record"
    When the user requests to view the transaction history
    Then the system displays the transaction history
    And the system does not record the transaction history

  # Scenario: User explicitly opts to record the transaction history when allowed
  Scenario: User opts-in to record transaction history when permitted
    Given the user has permission to "check transaction history" and permission to "keep record"
    And the user indicates an option to "record transaction history"
    When the user retrieves the transaction history
    Then the system displays the transaction history
    And the system records the transaction history

  # Scenario: User without any permission tries to check or record transaction history
  Scenario: User without proper permission is denied access to transaction history
    Given the user does not have permission to "check transaction history" nor "keep record"
    When the user attempts to view the transaction history
    Then the system denies access and displays an authorization error message

  # Scenario: User with check permission only attempts to record transaction history
  Scenario: User with check-only permission attempts to record transaction history
    Given the user has permission to "check transaction history" but does not have permission to "keep record"
    When the user attempts to opt in for transaction history recording
    Then the system displays the transaction history without recording any transaction history
    And the system informs the user that recording is not allowed with their current permissions
