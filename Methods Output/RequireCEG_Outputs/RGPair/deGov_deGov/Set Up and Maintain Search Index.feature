Feature: Set Up and Maintain Search Index

  As an administrator
  I want the system to automatically update the search index when content is added, modified, or deleted
  So that I can ensure that the search results are accurate and up-to-date

  Background:
    Given the system has predefined field criteria for content
    And the search index settings are accessible to the administrator

  Scenario: Adding new content with media
    Given the administrator adds new content that includes media
    When the content is added to the system
    Then the search index should be updated to include the new content
    And the media should be categorized correctly based on its type

  Scenario: Modifying existing content
    Given existing content has been modified
    When the administrator saves the changes to the content
    Then the system must trigger a re-indexing of the modified content
    And the search index should accurately reflect the latest updates

  Scenario: Failing to meet field criteria
    Given the administrator adds new content that fails predefined field criteria
    When the content is submitted for indexing
    Then the system must flag the content and prevent it from being indexed
    And the system should display a message indicating the reason for the flag

  Scenario: Deleting content
    Given the administrator deletes existing content
    When the content is removed from the system
    Then the corresponding entries should be removed from the search index immediately
    And the search index must maintain data integrity without any stale entries

  Scenario: Accessing search index settings
    Given the administrator wants to access search index settings
    When the settings screen is displayed
    Then customizable options for index parameters should be presented
    And the administrator should be able to perform manual updates as required

  Scenario: Automatic re-indexing after verification
    Given the administrator adds new content
    And the new content is verified to meet all field criteria
    When the content is confirmed for indexing
    Then the system updates the search index with the new content

  Scenario: Manually updating search index
    Given the administrator accesses the search index settings
    When the administrator chooses to update the index parameters
    Then the specified changes should be applied successfully
