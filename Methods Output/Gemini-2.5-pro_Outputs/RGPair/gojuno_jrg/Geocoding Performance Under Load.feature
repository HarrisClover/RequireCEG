Feature: Geocoding Performance Under Load

  As a system operator,
  I want the geocoding service to maintain efficiency under load
  So that it remains responsive and meets service level agreements.

  Scenario: System handles target load without administrative data lookup optimization
    Given the geocoding service is configured for standard operation
    When the system receives <target_rps_standard> geocoding requests per second over a sustained period
    Then the average response time should remain below <max_avg_response_time_ms> milliseconds
    And the error rate should remain below <max_error_rate_percent>%

  Scenario: System handles target load with administrative data lookup optimization
    Given the geocoding service is configured with administrative data optimizations enabled
    When the system receives <target_rps_optimized> geocoding requests per second over a sustained period
    Then the average response time should remain below <max_avg_response_time_ms> milliseconds
    And the error rate should remain below <max_error_rate_percent>%