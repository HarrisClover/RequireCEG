Feature: User Authentication and Room Booking System
As a registered user,
I want to securely log in, view blog posts, create my own blog posts, and make room reservations
So that I can interact with the system and perform necessary actions

Scenario: User Registration and Login
Given a user is not logged in
When the user registers with a valid email and password
Then the user should be able to log in
And the user should have access to protected features

Scenario: User Login Failure
Given a user is registered with an email and password
When the user attempts to log in with an incorrect password
Then the system should deny access

Scenario: User Commenting on Blog Posts
Given a user is logged in
And the user is viewing a blog post created by another user
When the user submits a comment on the blog post
Then the comment should be successfully posted

Scenario: User Attempting to Comment on Own Blog Post
Given a user is logged in
And the user is viewing their own blog post
When the user tries to comment on their own post
Then the system should not allow the comment to be posted

Scenario: Viewing Most Commented Blog Posts
Given a user is logged in
When the user views the blog post list
Then the blog posts should be ordered by the number of comments
And the posts should be paginated for easy navigation

Scenario: User Creating Blog Post
Given a user is logged in
When the user creates a new blog post with valid content
Then the blog post should be visible to all users
And the blog post should include the author's attribution

Scenario: Viewing Available Rooms for Reservation
Given a user is logged in
When the user views the list of available rooms
Then the system should display rooms with their corresponding dates, prices, and capacity

Scenario: User Reserving a Room
Given a user is logged in
And the user selects a room for reservation
When the user reserves the room
Then the system should calculate the total charges, including taxes
And send a confirmation of the reservation

Scenario: Room Availability Update After Reservation
Given a user has reserved a room
When the reservation is confirmed
Then the list of available rooms should be updated accordingly
