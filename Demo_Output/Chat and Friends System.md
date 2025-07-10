Feature: Chat and Friends System

  As a player
  I want to manage friend requests, blocking, and chat messaging
  So that I can interact with friends securely and communicate effectively

  Background:
    Given the system supports player accounts and status tracking
    And players can log in and be either online or offline

  Scenario: Sending a friend request
    Given player A is logged into the system
    And player B exists and is not blocked by player A
    When player A sends a friend request to player B
    Then the request is recorded as pending for player B
    And player A is notified that the friend request is pending

  Scenario: Accepting a friend request
    Given player B has a pending friend request from player A
    When player B accepts the friend request
    Then players A and B are added to each other's friends list
    And both players can see each other's online status immediately

  Scenario: Declining a friend request
    Given player B has a pending friend request from player A
    When player B declines the friend request
    Then the friend request is removed
    And player A is notified that the request was declined

  Scenario: Blocking a friend request sender
    Given player B has a pending friend request from player A
    When player B blocks player A
    Then the friend request is removed
    And player A is notified that the request was blocked by the recipient

  Scenario: Blocking a player
    Given player A has blocked player B
    When player B attempts to send a friend request or message to player A
    Then the system prevents the action
    And player B receives an error notification indicating the block status

  Scenario: Viewing online presence of friends
    Given player A and player B are friends
    And player B is currently online
    When player A views their friends list
    Then player A sees player B's online status in real-time

  Scenario: Sending a chat message to an online friend
    Given player A and player B are friends
    And player B is online
    When player A sends a chat message to player B
    Then the message is delivered instantly
    And player B's chat interface displays the message immediately

  Scenario: Sending a chat message to an offline friend
    Given player A and player B are friends
    And player B is offline
    When player A sends a chat message to player B
    Then the message is stored securely
    And the message is delivered automatically to player B upon next login
    And player B receives a notification of the new message

  Scenario: Group chat message broadcasting
    Given players A, B, and C are members of the same group chat
    And player B is online and players A and C are either online or offline
    When player B sends a message in the group chat
    Then the message is broadcast to all other group members
    And online members receive the message in real-time
    And offline members receive the message upon next login

  Scenario: Friends can view real-time online presence
    Given player A and player B are friends
    And player B is online
    When player A checks online status of player B
    Then player A sees player B's online presence updated in real-time

  Scenario: Mutually exclusive friend request response - decline or block
    Given player B has a pending friend request from player A
    When player B responds to the friend request
    Then player B can only decline or block player A, not both simultaneously
