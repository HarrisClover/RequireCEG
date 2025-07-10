Feature: Movie Filtering and Sorting
  As a concerned parent or moviegoer,
  I want to filter and sort movies based on MPAA ratings and other criteria
  So that I can easily find appropriate movies for my family or by my preferred sorting method

Scenario Outline: Filter movies by MPAA rating
  Given that the movie database includes movies with various MPAA ratings
  When I select the rating filter with the checkbox for "<rating>"
  Then the system should display only movies with the "<rating>" rating
  And the list of displayed movies should include titles such as "Aladdin", "The Terminator", and "When Harry Met Sally"

Examples:
  | rating |
  | PG     |
  | R      |
  | PG-13  |

Scenario Outline: Apply multiple rating filters
  Given that the movie database includes movies with various MPAA ratings
  When I select the rating filters for "<rating1>" and "<rating2>"
  Then the system should display only movies with either "<rating1>" or "<rating2>" ratings
  And the list of displayed movies should include titles such as "Aladdin", "The Terminator", and "When Harry Met Sally"

Examples:
  | rating1 | rating2 |
  | PG      | R       |
  | PG-13   | R       |

Scenario: Filter movies with no rating selected
  Given that the movie database includes movies with various MPAA ratings
  When no rating filter is selected
  Then the system should display all movies regardless of their rating
  And the list should include titles such as "Aladdin", "The Terminator", and "When Harry Met Sally"

Scenario Outline: Sort movies by title or release date
  Given that the movie database includes movies with titles and release dates
  When I sort the movie list by "<sorting-criteria>"
  Then the movies should be sorted accordingly by "<sorting-criteria>"
  And the first movie in the list should match the correct order based on "<sorting-criteria>"

Examples:
  | sorting-criteria |
  | title            |
  | release date     |

Scenario: Sort movies with no criteria selected
  Given that the movie database includes movies with titles and release dates
  When no sorting criteria is selected
  Then the system should display the movies in their default order
  And the movies should be presented in a random order based on the system’s default sorting

Scenario: Filter and sort movies simultaneously
  Given that the movie database includes movies with various MPAA ratings
  And the rating filter is set to "PG"
  When I sort the movie list by "release date"
  Then the system should display movies rated "PG"
  And the movies should be sorted by release date in ascending order
