Feature: Implement a Rating System for Documentation

  As a documentation user
  I want to be able to rate the user documentation and receive appropriate feedback based on my submissions
  So that I can provide feedback on its clarity and usefulness and others can benefit from these ratings

  Background:
    Given the documentation page is accessible
    And the documentation content is available

  Scenario: Scenario 1: Submit Positive Rating Successfully
    Given the user views the documentation
    When the user submits a positive rating
    Then the rating should be recorded
    And the average rating should be updated accordingly

  Scenario: Scenario 2: Submit Negative Rating Successfully
    Given the user views the documentation
    When the user submits a negative rating
    Then the rating should be recorded
    And the average rating should be updated accordingly

  Scenario: Scenario 3: Documentation Unavailable for Ratings Submission
    Given the documentation page is down
    Then the message 'Documentation unavailable' should be displayed

  Scenario: Scenario 4: No Ratings Submitted Yet
    Given the user views the documentation
    When the user checks the ratings
    Then the message 'No ratings available' should be displayed

  Scenario: Scenario 5: Handle Non-Submission of Ratings
    Given no ratings have been submitted
    When the user views the documentation
    Then the system displays 'No ratings available'

  Scenario: Scenario 6: Ratings Submission Validations
    Given the user intends to submit a rating
    When the documentation is not available
    Then the system displays 'Documentation unavailable'
