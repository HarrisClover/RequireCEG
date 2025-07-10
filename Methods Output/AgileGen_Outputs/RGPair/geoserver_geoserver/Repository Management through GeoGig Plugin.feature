Feature: Repository Management through GeoGig Plugin
  As a system administrator,
  I want to manage repositories via the GeoGig Plugin
  So that I can initialize, import, and handle repository lifecycle through the RESTful API

Scenario: Attempt to create a repository that already exists
  Given the repository "existing-repo" already exists
  When a request is made to create a repository with the same name "existing-repo"
  Then the response status should be "409 Conflict"
  And the response body should indicate the failure reason with a message "Repository already exists"

Scenario: Attempt to rename a repository
  Given a repository "sample-repo" exists
  When a request is made to rename the repository "sample-repo" to "new-repo"
  Then the response status should be "400 Bad Request"
  And the response body should indicate that renaming is not supported with a message "Renaming repositories is not supported"

Scenario: Import an existing repository with a disabled resolver
  Given the repository "import-repo" exists
  And the resolver for the repository type is disabled
  When an import request is made for the repository "import-repo"
  Then the response status should be "400 Bad Request"
  And the response body should indicate the unhandled URI type with a message "Unsupported URI type due to disabled resolver"

Scenario: Successfully import an unmanaged repository
  Given the repository "unmanaged-repo" exists and is not managed
  When an import request is made for the repository "unmanaged-repo"
  Then the response status should be "200 OK"
  And the response body should contain the details of the imported repository in both XML and JSON formats

Scenario: Attempt to import a non-existent repository
  Given no repository exists with the name "nonexistent-repo"
  When an import request is made for the repository "nonexistent-repo"
  Then the response status should be "404 Not Found"
  And the response body should indicate that the repository does not exist with a message "Repository not found"

Scenario: Prevent creation of a repository that is already managed
  Given the repository "managed-repo" is already managed by the system
  When a request is made to create the repository "managed-repo"
  Then the response status should be "409 Conflict"
  And the response body should indicate that the repository cannot be created because it is already managed with a message "Repository is already managed"
