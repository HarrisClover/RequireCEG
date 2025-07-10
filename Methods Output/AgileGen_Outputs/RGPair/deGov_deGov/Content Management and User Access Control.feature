Feature: Content Management and User Access Control  
As a privileged user (administrator),  
I want to manage content and users effectively  
So that I can ensure the platform operates smoothly and users have the appropriate access levels.  

Scenario Outline: Managing content types  
Given that the user has the <role> role  
And the user is logged into the System  
When the user navigates to the content management section  
And the user adds a new content type  
Then the content type should have the required fields: <fields>  
And the content type should be verifiable by users with appropriate permissions  

Examples:  
| role      | fields                       |  
| admin     | Name, Description, Metadata  |  
| moderator | Name, Description             |  

Scenario Outline: Adding media to the platform  
Given that the user has the <role> role  
And the user is logged into the System  
When the user adds media of type <media-type>  
Then the media should be uploaded successfully  
And the media should have the necessary metadata: <metadata>  

Examples:  
| role      | media-type | metadata                             |  
| admin     | document   | Name, Author, Date                   |  
| admin     | image      | Name, Resolution, Description         |  

Scenario Outline: Managing user accounts and access levels  
Given that the user has the <role> role  
And the user is logged into the System  
When the user creates a new user account with role <user-role>  
Then the user account should be created successfully  
And the new user should have the <user-role> access level  

Examples:  
| role      | user-role  |  
| admin     | user       |  
| admin     | moderator  |  

Scenario Outline: Configuring cookie compliance settings  
Given that the user has the <role> role  
And the user is logged into the System  
When the user navigates to cookie compliance settings  
And the user configures the cookie compliance as <compliance-status>  
Then the system should display the correct cookie compliance message based on <compliance-status>  

Examples:  
| role      | compliance-status |  
| admin     | enabled           |  
| admin     | disabled          |  

Scenario Outline: Creating and managing terms within taxonomies  
Given that the user has the <role> role  
And the user is logged into the System  
When the user creates a new term in the <taxonomy>  
Then the term should be created successfully  
And the term should be associated with the <taxonomy>  

Examples:  
| role      | taxonomy   |  
| admin     | categories |  
| admin     | tags       |  

Scenario Outline: Verifying user permissions and access to content  
Given that the user has the <role> role  
And the user is logged into the System  
When the user attempts to access <content-type>  
Then the user should be able to view the content if they have appropriate permissions  

Examples:  
| role      | content-type    |  
| admin     | press releases  |  
| moderator | press releases  |  