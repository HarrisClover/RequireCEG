Feature: Upload Documents

  As an administrator
  I want to upload documents while ensuring file type and size validation
  So that I can maintain proper document management within the system

  Background:
    Given the system accepts specific file formats and has a maximum file size limit
    And the administrator has logged into the system

  Scenario: Scenario 1: Successful Document Upload
    Given the administrator selects a file with a valid format and within the size limit
    When the administrator initiates the file upload
    Then the system displays a confirmation message
    And the administrator is prompted to enter the document name and relevant details

  Scenario: Scenario 2: Invalid File Type
    Given the administrator selects a file with an invalid format
    When the administrator attempts to upload the file
    Then the system displays an error message indicating that the uploaded file type is not among the accepted formats

  Scenario: Scenario 3: File Size Exceeds Limit
    Given the administrator selects a file that exceeds the maximum size limit
    When the administrator tries to upload the file
    Then the system displays an error message indicating that the file size exceeds the allowed limit

  Scenario: Scenario 4: Mandatory Fields Not Completed
    Given the administrator has uploaded a document successfully
    When the administrator attempts to finalize the upload without completing the mandatory fields
    Then the system prompts the administrator to complete mandatory fields if they are left empty

  Scenario: Scenario 5: Document Upload without Error
    Given the administrator selects a file with an accepted format and within the size limit
    When the administrator initiates the upload process
    Then the system confirms the upload and indexes the document for retrievability by authorized users

  Scenario Outline: Scenario Outline: Document Upload Validation
    Given the administrator uploads a file of type '<file-type>'
    And the file size is <file-size>
    When the administrator initiates the upload process
    Then the outcome should be '<expected-outcome>'
    Examples:
      | file-type | file-size | expected-outcome |
      | PDF | 2MB | success |
      | TXT | 3MB | invalid file type |
      | DOCX | 10MB | success |
      | JPEG | 5MB | invalid file type |
      | PDF | 11MB | file size exceeds limit |

