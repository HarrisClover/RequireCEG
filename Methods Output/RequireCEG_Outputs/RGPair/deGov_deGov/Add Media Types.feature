Feature: Add Media Types

  As an administrator
  I want to upload different types of media such as documents, images, or contacts
  So that I can manage my content effectively

  Background:
    Given the system is operational
    And the administrator has logged into the content management dashboard

  Scenario: Scenario 1: Upload a Document
    Given the media type is selected as document
    And the document name is provided
    And a valid document file is uploaded
    When the administrator submits the document
    Then the system confirms the document entry with a success message
    And the document is retrievable in the media management dashboard

  Scenario: Scenario 2: Upload an Image
    Given the media type is selected as image
    And the image name is provided
    And a valid image file is uploaded
    When the administrator submits the image
    Then the system confirms the image entry with a success message
    And the image is retrievable in the media management dashboard

  Scenario: Scenario 3: Add a Contact
    Given the media type is selected as contact
    And the user's name is provided
    And the contact details are provided
    When the administrator submits the contact
    Then the system confirms the contact entry with a success message
    And the contact is retrievable in the media management dashboard

  Scenario: Scenario 4: Incomplete Document Upload Fields Validation
    Given the media type is selected as document
    When the administrator attempts to submit the form without providing the document name and uploading the valid document file
    Then the system generates and displays an error message highlighting the specific incomplete fields
    And the document is not saved in the media management dashboard.

  Scenario Outline: Scenario Outline: Validate Media Upload
    Given the media type is selected as <media-type>
    When the administrator attempts to submit the form without completing the required fields
    Then the system displays an error message for the <missing-fields>
    Examples:
      | media-type | missing-fields |
      | document | document name and file upload |
      | image | image name and file upload |
      | contact | user's name and contact details |

