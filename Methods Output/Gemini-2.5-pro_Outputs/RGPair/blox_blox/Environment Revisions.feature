Feature: Environment Revisions
  As a System Auditor or Operator,
  I want environment changes to be tracked via revisions,
  So that I can audit the history of environment configurations and troubleshoot issues.

  Scenario: Revision captured on successful environment creation
    Given cluster "audit-cluster" exists
    When I create an environment named "audited-app" with configuration '{"version": "1.0"}' in cluster "audit-cluster"
    Then the operation should be successful
    And a revision should be recorded for environment "audited-app" in cluster "audit-cluster"
    And the latest revision should detail the successful creation and the configuration '{"version": "1.0"}'

  Scenario: Revision captured on successful environment update
    Given cluster "audit-cluster" exists
    And environment "audited-app" exists in cluster "audit-cluster" with configuration '{"version": "1.0"}'
    When I update environment "audited-app" in cluster "audit-cluster" with configuration '{"version": "1.1", "feature_flag": true}'
    Then the operation should be successful
    And a new revision should be recorded for environment "audited-app" in cluster "audit-cluster"
    And the latest revision should detail the successful update and the configuration '{"version": "1.1", "feature_flag": true}'

  Scenario: Revision captures error details (Example: Duplicate Creation Attempt)
    Given cluster "audit-cluster" exists
    And environment "existing-audited-app" exists in cluster "audit-cluster"
    When I attempt to create an environment named "existing-audited-app" in cluster "audit-cluster"
    Then the operation should fail
    And a revision or event log should be recorded for the failed attempt on "existing-audited-app" in cluster "audit-cluster"
    And the revision/log should detail the error type "environment already exists"

  Scenario: Attempt to access revisions for a non-existent environment
    Given cluster "audit-cluster" exists
    And environment "no-history-app" does not exist in cluster "audit-cluster"
    When I attempt to list revisions for environment "no-history-app" in cluster "audit-cluster"
    Then the operation should fail
    And an informative error message indicating "environment not found" should be returned

