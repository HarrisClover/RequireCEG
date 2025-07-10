Feature: Validate EPUB Publications Compliance Using EPUBCheck
As a developer or QA engineer,
I want to verify that EPUB publications comply with specifications across various versions and profiles,
So that users have a consistent and accessible experience across platforms.

Scenario: Validate structure of Package, Content, and Navigation Documents
Given an EPUB publication with Package Documents, Content Documents, and Navigation Documents
When the EPUBCheck tool analyzes the publication
Then it should confirm the presence of all required elements
And it must verify that all data types and properties conform to EPUB 3.2 and earlier specifications
And it should ensure documents adhere to the specific structure rules defined for each document type

Scenario: Report errors for media types, identifiers, and URLs
Given an EPUB publication with various media resources and document references
When the EPUBCheck tool validates the publication
Then it should identify and report errors related to invalid or unrecognized media types
And it must report any missing, duplicate, or improperly formatted identifiers
And it should flag any non-conforming URLs or improper attributes present in the documents

Scenario: Verify correct usage of media overlays, accessibility features, and metadata
Given an EPUB publication that includes media overlays, accessibility features, and extensive metadata
When the EPUBCheck tool processes the publication
Then it should verify that media overlays are implemented correctly
And it must check that accessibility features are fully and correctly utilized
And it should ensure metadata properties, including essential identifiers such as 'dc:type' for dictionaries and glossaries, are correctly applied

Scenario: Validate handling of remote resources and support for various document formats
Given an EPUB publication that references remote resources and incorporates multiple document formats
When the EPUBCheck tool evaluates the publication
Then it should confirm that remote resources are accessible and correctly validated
And it must support and correctly identify the various document formats as per the defined media types

Scenario: Report warnings for deprecated attributes or elements
Given an EPUB publication that may include outdated or deprecated attributes and elements
When the EPUBCheck tool reviews the publication
Then it should raise warnings for any instances of deprecated attributes or elements
And it must provide guidance on updating or replacing deprecated usage to comply with current standards

Scenario: Provide detailed feedback for publication usability and compliance
Given an EPUB publication under review
When the EPUBCheck tool completes the validation process
Then it should provide detailed feedback outlining all detected errors, warnings, and recommendations
And it must include information on necessary corrections to ensure optimal usability and full compliance with EPUB specifications
And the feedback should support developers in resolving issues before publication