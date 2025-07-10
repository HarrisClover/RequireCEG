Feature: Comprehensive Error Reporting and Crash Handling

As an application developer, I want our system to effectively capture and report errors—including native crashes and unhandled exceptions—so that all necessary information (error type, message, severity, user, and device metadata) is logged accurately and sessions are tracked properly.

Scenario: Reporting Native Crash in NDK and JVM Code
Given the app is initialized with the Bugsnag notifier and proper configuration
And the system is set up to capture exceptions in both the JVM and the native (NDK) environments
When a native crash or unhandled exception occurs (e.g. null pointer dereference, stack overflow, or StrictMode violation)
Then an error report should be generated with a complete payload that includes:

Error class and message

Severity level

Device information and app metadata

User context and session details
And the report is accurately tagged as a handled or unhandled exception

Scenario: Preventing Duplicate Error Reports
Given an error condition has been reported previously
When the same error (with identical error class, message, and context) occurs again
Then the system should avoid sending a duplicate report
And duplicate suppression should not interfere with the initial, accurate error payload

Scenario: Persisting User and Device Metadata Across Sessions
Given a user has logged into the application and metadata (device data, app version, etc.) has been recorded
When a crash or error is reported in a subsequent session
Then the prior metadata should persist in the error payload
And session tracking must accurately reflect changes between sessions

Scenario: Accurate Breadcrumb Logging for Events
Given both manual and automatic breadcrumb logging is enabled in the application
When events occur prior to a crash or error
Then breadcrumbs should be accurately logged in the error report
And the timeline of breadcrumbs must allow developers to reconstruct the event flow leading up to the issue

Scenario: Custom Metadata and Plugin Integration
Given the system supports configuration initialization and custom metadata processing via a plugin interface
When custom tags or additional metadata are added by the plugin
Then the error payload must include this custom metadata without disruption
And unusual strings in user data do not affect functionality or metadata filtering

Scenario: Reporting ANRs in Both JVM and Native (CXX) Environments
Given the application is monitoring for Application Not Responding (ANR) events in both JVM and native code
When an ANR is triggered
Then the system should capture and report the incident
And the report should detail its impact on app performance, including contextual metadata and session information