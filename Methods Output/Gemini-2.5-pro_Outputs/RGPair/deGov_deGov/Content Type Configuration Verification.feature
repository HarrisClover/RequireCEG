Feature: Content Type Configuration Verification
  As a user with verification permissions (e.g., Administrator)
  I want to verify the configuration of content types
  So that I can ensure content structures meet the requirements.

  Scenario Outline: Verify Fields and Paragraphs for a Content Type
    Given I am logged in with permissions to view content type configurations
    When I inspect the configuration for the "<ContentType>" content type
    Then the content type should include the field "<FieldName>"
    And the content type should allow adding "<ParagraphType>" paragraphs.
    # Add more 'And' steps for other required fields or paragraphs

    Examples:
      | ContentType   | FieldName | ParagraphType   |
      | Normal Page   | Title     | Text Block      |
      | Press Release | Date      | Image Embed     |
      | Contact       | Email     | Contact Details | # Assuming Contact is a content type

