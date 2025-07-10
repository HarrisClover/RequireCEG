Feature: Content Management and User Access

  # This feature verifies that administrators can manage content using a user-friendly interface and that
  # anonymous users can navigate to public pages like the start page, login, and sitemap.

  Background:
    Given the content management system is deployed
    And the system is configured with proper cookie compliance settings, a search index, and menu links

  Scenario: Administrator logs in and accesses content management functions
    Given a user with the administrator role is on the login page
    When the administrator enters valid credentials and logs into the system
    Then they should see a dashboard with access to content management functionalities

  Scenario: Administrator adds media with metadata
    Given the administrator is logged into the system
    When they navigate to the "Add Content" section
    And they choose to add a new media item (such as a document, image, or contact)
    And they fill in required metadata fields like name and contact details
    Then the system should create the new media item with all the provided fields verified

  Scenario: Administrator adds taxonomy terms and new pages
    Given the administrator is logged into the system
    When they navigate to the content management area for taxonomies and pages
    And they add new terms to selected taxonomies
    And they create a normal page or a press release with essential buttons and fields for user interactions
    Then the new content should be stored and visible to users with adequate permissions
    And all preconfigured fields and relevant paragraphs are present

  Scenario: Cookie compliance and search index configurations are valid
    Given the system is live
    When the cookie compliance settings are reviewed
    And the search index and menu links are audited by an administrator
    Then the system should confirm that all configurations meet the required standards

  Scenario: User account creation and management by administrators
    Given the administrator is logged into the system
    When they navigate to the user management area
    And they create a new user account with appropriate access levels
    Then the new user should be able to log in with the assigned permissions

  Scenario: Anonymous user access to public pages
    Given an anonymous user accesses the system
    When they visit the start page
    And they navigate to the login page and sitemap option
    Then the start page should be accessible without authentication
    And the login and sitemap options should be visible and functional
