Feature: Movie List Sorting
  As an avid moviegoer or user
  I want to sort the displayed movie list by title or release date
  So that I can browse the movies in my preferred order.

  Background:
    Given the following movies exist in the database:
      | title                | rating | release_date |
      | Aladdin              | G      | 1992-11-25   |
      | The Terminator       | R      | 1984-10-26   |
      | When Harry Met Sally | R      | 1989-07-21   |
      | Toy Story            | PG     | 1995-11-22   |
      | The Lion King        | G      | 1994-06-15   |
      | Deadpool             | R      | 2016-02-12   |
    And I am on the RottenPotatoes home page

  Scenario: Default view displays movies (e.g., sorted by Title)
    # Assuming default sort is by Title Ascending if not otherwise specified
    Then the movies should appear in the following order:
      | title                |
      | Aladdin              |
      | Deadpool             |
      | The Lion King        |
      | The Terminator       |
      | Toy Story            |
      | When Harry Met Sally |

  Scenario: Sort movies by Title
    When I sort the movies by "Title"
    Then the movies should appear in the following order:
      | title                |
      | Aladdin              |
      | Deadpool             |
      | The Lion King        |
      | The Terminator       |
      | Toy Story            |
      | When Harry Met Sally |

  Scenario: Sort movies by Release Date
    When I sort the movies by "Release Date"
    Then the movies should appear in the following order:
      | title                |
      | The Terminator       | # 1984
      | When Harry Met Sally | # 1989
      | Aladdin              | # 1992
      | The Lion King        | # 1994
      | Toy Story            | # 1995
      | Deadpool             | # 2016

  Scenario: Sorting applies to filtered results
    Given I check the "R" rating filter
    When I sort the movies by "Title"
    Then the movies should appear in the following order:
      | title                |
      | Deadpool             |
      | The Terminator       |
      | When Harry Met Sally |
    And I should not see "Aladdin"
    And I should not see "Toy Story"
    And I should not see "The Lion King"