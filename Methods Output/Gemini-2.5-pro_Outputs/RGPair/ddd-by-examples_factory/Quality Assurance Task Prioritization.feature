Feature: Quality Assurance Task Prioritization
  As a Quality Assurance Manager
  I want the system to prioritize QA tasks for parts that are locked in stock
  So that critical inventory can be processed efficiently.

  Scenario: Prioritizing QA for locked parts
    Given Part "LOCKED-001" is in stock and has a 'Locked' status requiring QA
    And Part "UNLOCKED-002" is in stock and requires standard QA
    And Part "LOCKED-003" is in stock and has a 'Locked' status requiring QA
    When the QA task list is displayed or generated
    Then the QA tasks for "LOCKED-001" and "LOCKED-003" should appear with higher priority than the task for "UNLOCKED-002".