Feature: Filtering and Sorting Movies
As a user (concerned parent or moviegoer),
I want to filter movies based on their MPAA ratings and sort them by title or release date
So that I can easily find movies that are appropriate for my family or for my personal preferences.

Scenario 1: Filtering movies by MPAA rating ('PG' and 'R')
Given that the user is on the RottenPotatoes homepage
When the user selects the 'PG' and 'R' rating checkboxes
Then the system should display only the movies rated 'PG' or 'R'

Scenario 2: No ratings selected
Given that the user is on the RottenPotatoes homepage
When the user selects no checkboxes for ratings
Then the system should display all movies regardless of rating

Scenario 3: Sorting movies by title
Given that the user is on the RottenPotatoes homepage
When the user selects to sort movies by title
Then the system should display the movies in alphabetical order by title

Scenario 4: Sorting movies by release date
Given that the user is on the RottenPotatoes homepage
When the user selects to sort movies by release date
Then the system should display the movies sorted from the earliest to the latest release date

Scenario 5: Default view with no filters and sorting applied
Given that the user is on the RottenPotatoes homepage
When no filters or sorting options are selected
Then the system should display all movies with no specific sorting order applied