Feature: Error Reporting and Crash Handling
  As a developer,
  I want the application to report crashes and unhandled exceptions effectively
  So that I can analyze errors and improve app stability

Scenario Outline: Report Crashes and Handle Exceptions
  Given the application is running with Bugsnag properly initialized
  And the user is interacting with the app
  When an error occurs such as <error-type>
  Then the error report should capture the error class as <error-class>
  And the error report should include a message containing <error-message>
  And the error report should indicate the severity as <severity-level>
  And the error report should contain user information including <user-info>
  And the error payload should include device metadata like <device-info>
  And no duplicate error reports should be sent
  And the error should be tagged as <error-status>
  And the report should contain relevant session data
  
Examples:
  | error-type        | error-class   | error-message            | severity-level | user-info          | device-info          | error-status  |
  | NullPointerException | java.lang.NullPointerException | Null pointer dereference  | High            | user123, locationX | Android, Pixel 4    | Unhandled     |
  | StackOverflowError   | java.lang.StackOverflowError   | Stack overflow detected    | Critical        | user456, locationY | iOS, iPhone 13     | Handled       |
  | ANRException         | android.os.ApplicationNotRespondingException | ANR detected              | Medium          | user789, locationZ | Android, Galaxy S9 | Unhandled     |

Scenario Outline: Report ANRs and Handle Performance Impact
  Given the application has been running for a while
  When the app experiences an ANR scenario in <environment>
  Then the ANR report should be captured with performance impact details
  And the report should indicate the environment as <environment>
  And the report should contain the duration of the ANR as <duration>

Examples:
  | environment  | duration |
  | JVM          | 5 seconds|
  | CXX          | 7 seconds|

Scenario Outline: Handle Unusual Strings in User Data
  Given the user data contains unusual strings like <unusual-string>
  When an error occurs involving this user data
  Then the system should process the metadata correctly without disruption
  And the error report should filter out any unusual characters in the metadata

Examples:
  | unusual-string  |
  | <script>alert</script> |
  | %3Cimg%20src%3D%22%20%3E%20 |

Scenario: Breadcrumb Logging for Events
  Given the system has been initialized to capture breadcrumbs
  When a user interacts with the application
  Then the system should log automatic breadcrumbs
  And the system should allow manual breadcrumb logging
  And all breadcrumbs should be included in the error reports
