Feature: Todo List Management
As a user,
I want to maintain a Todo list
So that I can effectively track and manage the tasks I need to complete.

Scenario: Adding a new task to the Todo list
Given that I am logged into the system,
When I create a new task with the description "<task-description>",
Then the task should be added to my Todo list with the description "<task-description>",
And the task should be marked as "not completed".

Scenario Outline: Adding multiple tasks to the Todo list
Given that I am logged into the system,
When I create a new task with the description "<task-description>",
Then the task should be added to my Todo list with the description "<task-description>",
And the task should be marked as "not completed".

Examples: | task-description | | Task 1 | | Task 2 | | Task 3 |