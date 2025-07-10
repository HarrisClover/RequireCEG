Feature: Content Management by Administrators
  As an Administrator
  I want to manage various content types through a user-friendly interface
  So that I can keep the website content up-to-date and relevant.

  Scenario Outline: Adding Media Content
    Given I am logged in as an Administrator
    When I navigate to the media addition interface
    And I choose to add a "<MediaType>"
    And I fill in the required metadata:
      | Field         | Value              |
      | Name          | <MediaName>        |
      | File/Details  | <MediaFileOrData>  |
      # Add other relevant metadata fields as needed per media type
    And I save the new media item
    Then the "<MediaType>" named "<MediaName>" should be available in the media library
    And its metadata should be stored correctly.

    Examples:
      | MediaType | MediaName        | MediaFileOrData        |
      | Document  | Annual Report    | /path/to/report.pdf    |
      | Image     | Company Logo     | /path/to/logo.png      |
      | Contact   | Sales Department | sales@example.com, etc |

  Scenario Outline: Adding Taxonomy Terms
    Given I am logged in as an Administrator
    And a taxonomy named "<TaxonomyName>" exists
    When I navigate to manage the "<TaxonomyName>" taxonomy
    And I add a new term named "<TermName>"
    And I save the term
    Then the term "<TermName>" should exist within the "<TaxonomyName>" taxonomy.

    Examples:
      | TaxonomyName | TermName      |
      | Categories   | News          |
      | Tags         | Q1-Update     |
      | Departments  | Human Resources |

  Scenario Outline: Creating Standard Content Pages
    Given I am logged in as an Administrator
    When I navigate to create a new "<ContentType>"
    And I fill in the required fields:
      | Field | Value                     |
      | Title | <PageTitle>               |
      | Body  | <PageBody>                |
      # Add other essential fields as needed
    And I ensure essential buttons like "Save", "Publish" are present
    And I save the "<ContentType>"
    Then a "<ContentType>" titled "<PageTitle>" should be created successfully
    And it should be accessible within the system.

    Examples:
      | ContentType   | PageTitle         | PageBody                  |
      | Normal Page   | About Us          | Details about the company |
      | Press Release | New Product Launch | Info about the new launch |

