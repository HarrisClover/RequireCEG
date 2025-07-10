Feature: Content Management and User Access
  As an administrator,
  I want to manage content, user accounts, and configure site settings
  So that I can control and customize the website experience

Scenario: Admin adds media with metadata
  Given that the user is an administrator
  When the admin adds a document with metadata
  Then the document should be successfully uploaded
  And the metadata should be saved with fields like name and contact details

Scenario: Admin creates terms in taxonomies
  Given that the user is an administrator
  When the admin creates a term in a selected taxonomy
  Then the term should be added to the taxonomy

Scenario: Admin creates pages and press releases
  Given that the user is an administrator
  When the admin creates a new page or press release
  Then the page or press release should be successfully created

Scenario: Admin verifies content types
  Given that the user is an administrator
  When the admin checks content types
  Then the content types should be verified with the necessary fields and paragraphs

Scenario: Admin configures cookie compliance settings
  Given that the user is an administrator
  When the admin configures cookie compliance settings
  Then the settings should be saved and reflect proper cookie compliance

Scenario: Admin manages search index and menu links
  Given that the user is an administrator
  When the admin configures the search index and menu links
  Then the search index should be structured and menu links should be properly configured

Scenario: Admin manages user accounts
  Given that the user is an administrator
  When the admin creates and manages user accounts
  Then the user accounts should be created with appropriate access levels

Scenario: Anonymous user accesses start page, login, and sitemap
  Given that the user is an anonymous user
  When the user accesses the start page, login, and sitemap options
  Then the user should be able to navigate to the start page, login, and sitemap options seamlessly
