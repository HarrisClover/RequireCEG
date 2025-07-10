Feature: Selecting Appropriately Sized Clothes for Boy and Girl

  As a customer
  I want to select clothes for a boy and a girl based on specific size requirements
  So that I can ensure the clothes I potentially buy will fit them correctly

  Background: Define Size Ranges
    Given the required size range for a boy is 20 to 30
    And the required size range for a girl is 20 to 25

  Scenario Outline: Selecting clothes based on size, type, and recipient
    When I attempt to select a "<cloth_type>" cloth of size <size> for a "<recipient>"
    Then the cloth selection status should be "<selection_status>"

    Examples: Standard Cases
      | cloth_type | size | recipient | selection_status | Description                     |
      |------------|------|-----------|--------------------|---------------------------------|
      # Boy clothes for Boy
      | Boy        | 20   | Boy       | selected           | Boy item, min size for boy      |
      | Boy        | 25   | Boy       | selected           | Boy item, mid size for boy      |
      | Boy        | 30   | Boy       | selected           | Boy item, max size for boy      |
      | Boy        | 19   | Boy       | rejected           | Boy item, too small for boy     |
      | Boy        | 31   | Boy       | rejected           | Boy item, too large for boy     |
      # Girl clothes for Girl
      | Girl       | 20   | Girl      | selected           | Girl item, min size for girl    |
      | Girl       | 22   | Girl      | selected           | Girl item, mid size for girl    |
      | Girl       | 25   | Girl      | selected           | Girl item, max size for girl    |
      | Girl       | 19   | Girl      | rejected           | Girl item, too small for girl   |
      | Girl       | 26   | Girl      | rejected           | Girl item, too large for girl   |

    Examples: Cross-Gender Cases
      | cloth_type | size | recipient | selection_status | Description                     |
      |------------|------|-----------|--------------------|---------------------------------|
      # Girl clothes for Boy
      | Girl       | 20   | Boy       | selected           | Girl item, fits boy range (min) |
      | Girl       | 25   | Boy       | selected           | Girl item, fits boy range       |
      | Girl       | 26   | Boy       | selected           | Girl item, fits boy range       |
      | Girl       | 30   | Boy       | selected           | Girl item, fits boy range (max) |
      | Girl       | 19   | Boy       | rejected           | Girl item, too small for boy    |
      | Girl       | 31   | Boy       | rejected           | Girl item, too large for boy    |
      # Boy clothes for Girl
      | Boy        | 20   | Girl      | selected           | Boy item, fits girl range (min) |
      | Boy        | 22   | Girl      | selected           | Boy item, fits girl range       |
      | Boy        | 25   | Girl      | selected           | Boy item, fits girl range (max) |
      | Boy        | 19   | Girl      | rejected           | Boy item, too small for girl    |
      | Boy        | 26   | Girl      | rejected           | Boy item, too large for girl    |
      | Boy        | 30   | Girl      | rejected           | Boy item, too large for girl    |

    Examples: No Fit Cases (Explicit)
      | cloth_type | size | recipient | selection_status | Description                     |
      |------------|------|-----------|--------------------|---------------------------------|
      | Boy        | 15   | Boy       | rejected           | Size too small for anyone     |
      | Girl       | 15   | Girl      | rejected           | Size too small for anyone     |
      | Boy        | 40   | Boy       | rejected           | Size too large for anyone     |
      | Girl       | 40   | Girl      | rejected           | Size too large for anyone     |
      | Boy        | 15   | Girl      | rejected           | Size too small (cross-gender) |
      | Girl       | 40   | Boy       | rejected           | Size too large (cross-gender) |