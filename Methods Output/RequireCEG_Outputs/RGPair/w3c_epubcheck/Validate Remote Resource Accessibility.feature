Feature: Validate Remote Resource Accessibility

  As a user of the accessibility validation tool
  I want to ensure the accessibility and validity of remote resources specified in an EPUB package
  So that I can maintain high-quality, compliant documents

  Background:
    Given the EPUB package contains remote resources with defined URLs
    And the tool is configured to validate these resources

  Scenario: Scenario 1: Resource URL is unreachable
    Given a resource URL that does not respond
    When the tool attempts to connect to the URL
    Then an error is raised indicating the resource's URL is unreachable

  Scenario: Scenario 2: Resource media type does not match
    Given a resource URL that is reachable
    When the tool checks the resource's media type
    Then a warning is generated stating the expected media type for user reference

  Scenario: Scenario 3: Resource is partially accessible
    Given a resource URL that returns a 4xx or 5xx status code
    When the tool checks the accessibility status
    Then a warning is provided outlining the accessibility status and advising users of potential limitations

  Scenario: Scenario 4: Resource contains deprecated attributes
    Given a resource that has elements with deprecated attributes
    When the tool scans the content of the resource
    Then a warning is issued to inform the user about deprecated attributes and encourage updates

  Scenario: Scenario 5: Validate resource with both URL and media type issues
    Given a resource URL that is unreachable
    And the expected media type is not as required
    When the tool performs an accessibility check
    Then an error is raised indicating the resource's URL is unreachable
    And a warning is generated stating the expected media type for user reference
