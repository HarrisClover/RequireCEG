Feature: Production Planning and Scheduling Adjustment
  As a Production Planner
  I want the system to adjust production schedules based on demand changes and manage resource utilization
  So that production meets demand efficiently without overlaps and considering constraints.

  Background:
    Given the system has access to production capacity and resource availability
    And the system knows the standard retooling time between different products is 2 hours

  Scenario: Adjusting production schedule due to increased demand
    Given an existing production schedule for the week of "2024-08-05"
    And the demand for Product "QRS" increases significantly for "2024-08-12"
    When the production planning module recalculates the schedule
    Then the schedule should attempt to allocate sufficient capacity and resources for the increased "QRS" demand
    And the system should verify that resource utilization remains within acceptable limits
    And the updated schedule should avoid production overlaps

  Scenario: Scheduling new production affects adjacent timelines
    Given Production Run "A" for Product "P1" is scheduled from "2024-08-06 08:00" to "2024-08-07 16:00"
    And Production Run "C" for Product "P3" is scheduled from "2024-08-08 08:00" to "2024-08-09 12:00"
    When a new Production Run "B" for Product "P2" is scheduled, requiring 10 hours of production time plus 2 hours retooling from P1
    And Run "B" needs to be completed before Run "C" starts
    Then Run "A" might be adjusted to finish earlier (e.g., "2024-08-07 14:00") if possible, to accommodate Run B
    And Run "B" should be scheduled after Run "A" (e.g., "2024-08-07 16:00" to "2024-08-08 02:00" including retooling)
    And Run "C" start time might be delayed (e.g., to "2024-08-08 10:00") if Run B's placement necessitates it, considering retooling from P2.

  Scenario: Preventing overlapping production schedules
    Given Production Run "X" is scheduled from "2024-09-10 10:00" to "2024-09-10 18:00" on Machine "M1"
    When the user attempts to schedule Production Run "Y" from "2024-09-10 15:00" to "2024-09-10 20:00" on Machine "M1"
    Then the system should detect the overlap
    And either reject the scheduling of Run "Y" as proposed
    Or automatically adjust Run "Y"'s start time to after Run "X" finishes (e.g., "2024-09-10 18:00")

