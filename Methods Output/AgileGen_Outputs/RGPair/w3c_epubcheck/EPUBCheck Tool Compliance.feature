Feature: EPUBCheck Tool Compliance

As a digital content publisher,  
I want to ensure that my EPUB files are compliant with various EPUB specifications,  
So that my EPUB content is properly validated and optimized for different platforms.

Scenario Outline: Validate EPUB file compliance
Given that the EPUBCheck tool is configured to check for <specification> compliance  
And the EPUB file contains a valid <document-type>  
And the EPUB file includes necessary metadata properties  
When the EPUB file is checked for validation  
Then the file should pass validation for required elements  
And the tool should report any errors or warnings for <document-type>  
And any deprecated attributes should trigger a warning  
Examples:  
| specification   | document-type |  
| EPUB 3.2        | Package Document |  
| EPUB for Education | Content Document |  
| EPUB Dictionaries | Navigation Document |  

Scenario Outline: Check remote resource handling
Given that the EPUBCheck tool is configured to handle remote resources  
And the EPUB file contains <resource-type> resources  
When the EPUB file is validated  
Then the tool should ensure that remote resources are correctly linked and validated  
And the media type for each resource should be correct  
Examples:  
| resource-type  |  
| external images |  
| audio files |  
| video files |  

Scenario Outline: Validate accessibility features
Given that the EPUB file contains accessibility features  
And the EPUBCheck tool is set to validate these features  
When checking the EPUB file for accessibility compliance  
Then the tool should ensure all required accessibility features are present  
And all identifiers for accessibility metadata should be validated correctly  
Examples:  
| accessibility-feature |  
| text-to-speech support |  
| image descriptions |  
| navigational aids |  

Scenario Outline: Ensure metadata compliance
Given that the EPUB file includes metadata  
And the tool validates that 'dc:type' is correctly assigned for the relevant document type  
When the EPUB file is checked for metadata compliance  
Then the tool should confirm that metadata properties adhere to the required specification  
And the tool should report any missing or invalid metadata properties  
Examples:  
| document-type   |  
| dictionary      |  
| glossary        |  
| e-book          |  

Scenario Outline: Validate deprecated attributes
Given that the EPUB file may include deprecated attributes  
And the EPUBCheck tool checks for deprecated elements  
When the EPUB file is checked for deprecated attributes  
Then the tool should raise a warning for any deprecated attributes found  
Examples:  
| deprecated-attribute |  
| 'xmlns' in Package Document |  
| 'audio' element in Content Document |  
| 'nav' element in Navigation Document |