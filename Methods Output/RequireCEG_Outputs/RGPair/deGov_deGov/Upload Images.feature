Feature: Upload Images

  As an administrator
  I want to upload image files with metadata
  So that I can manage and display images effectively on the platform

  Background:
    Given the system is on the image upload page
    And the administrator is logged in

  Scenario: Upload valid image
    Given the administrator clicks the 'Upload Images' button
    When the administrator selects a valid JPEG image
    Then the system should display a preview of the image
    And the input fields for name and description should be visible

  Scenario: Upload invalid file type
    Given the administrator clicks the 'Upload Images' button
    When the administrator selects a non-image file
    Then the system should display an error message indicating allowed formats

  Scenario: Submit image with empty metadata
    Given the administrator has selected a valid image
    When the administrator clicks 'Submit' without filling in required fields
    Then the system should display an error message that all fields are required

  Scenario: Upload image exceeding file size limit
    Given the administrator selects an image that exceeds the maximum file size
    When the administrator attempts to upload the image
    Then the system should display an alert stating 'Image size exceeds the limit'

  Scenario: Upload valid PNG image
    Given the administrator clicks the 'Upload Images' button
    When the administrator selects a valid PNG image
    Then the system should display a preview of the image
    And the input fields for name and description should be visible

  Scenario: Attempt to submit a JPEG image with empty metadata
    Given the administrator has selected a valid JPEG image
    When the administrator clicks 'Submit' without filling in required fields
    Then the system should display an error message that all fields are required

  Scenario: Attempting to upload when file is not valid
    Given the administrator clicks the 'Upload Images' button
    When the administrator selects an invalid file type
    Then the system should display an error message indicating allowed formats

  Scenario Outline: Upload image with metadata
    Given the administrator has selected a valid <file-type> image
    And the administrator enters <name> and <description>
    When the administrator clicks 'Submit'
    Then the system should confirm that the image has been uploaded successfully
    Examples:
      | file-type | name | description |
      | JPEG | Sample Image | This is a sample image description. |
      | PNG | Example Graphic | Example description for a graphic. |

