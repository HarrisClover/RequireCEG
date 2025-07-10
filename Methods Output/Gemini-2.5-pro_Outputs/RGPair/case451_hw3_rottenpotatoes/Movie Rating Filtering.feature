Feature: Movie Rating Filtering
  As a concerned parent or user
  I want to filter movies by their MPAA ratings on RottenPotatoes
  So that I can easily find movies appropriate for my viewing preferences or family.

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

  Scenario: Filter by a single rating (PG)
    When I check the "PG" rating filter
    Then I should see "Toy Story"
    And I should not see "Aladdin"
    And I should not see "The Terminator"
    And I should not see "When Harry Met Sally"
    And I should not see "The Lion King"
    And I should not see "Deadpool"

  Scenario: Filter by multiple ratings (PG and R)
    When I check the "PG" rating filter
    And I check the "R" rating filter
    Then I should see "The Terminator"
    And I should see "When Harry Met Sally"
    And I should see "Toy Story"
    And I should see "Deadpool"
    And I should not see "Aladdin"
    And I should not see "The Lion King"

  Scenario: No rating filters selected shows all movies
    # Assuming default state might have some filters checked, ensure none are
    When I uncheck the "G" rating filter
    And I uncheck the "PG" rating filter
    And I uncheck the "R" rating filter
    # Add unchecks for any other potential rating filters (e.g., PG-13, NC-17)
    Then I should see "Aladdin"
    And I should see "The Terminator"
    And I should see "When Harry Met Sally"
    And I should see "Toy Story"
    And I should see "The Lion King"
    And I should see "Deadpool"

  Scenario: All available rating filters selected shows all corresponding movies
    # Assuming G, PG, R are the only relevant ratings for the sample data
    When I check the "G" rating filter
    And I check the "PG" rating filter
    And I check the "R" rating filter
    Then I should see "Aladdin"
    And I should see "The Terminator"
    And I should see "When Harry Met Sally"
    And I should see "Toy Story"
    And I should see "The Lion King"
    And I should see "Deadpool"

# Feature 2: Sorting the Movie List

