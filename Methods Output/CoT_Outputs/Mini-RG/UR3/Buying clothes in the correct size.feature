Feature: Buying clothes in the correct size
  As a shopper,
  I want to buy clothes for a boy and a girl,
  So that I can ensure that the clothes fit and are the correct size.
Scenarios:
Buying clothes for a boy within the correct size range:

Scenario: Buying clothes for a boy within the correct size range
  Given I want to buy clothes for a boy
  And the available boy clothing sizes are 20 to 30
  When I select clothes with size 25
  Then the clothes should fit the boy
  And I should be able to purchase them
Buying clothes for a girl within the correct size range:

Scenario: Buying clothes for a girl within the correct size range
  Given I want to buy clothes for a girl
  And the available girl clothing sizes are 20 to 25
  When I select clothes with size 22
  Then the clothes should fit the girl
  And I should be able to purchase them
Buying clothes for a girl using a boy's size (if the size fits):

Scenario: Buying clothes for a girl using a boy's size (if the size fits)
  Given I want to buy clothes for a girl
  And the available boy clothing sizes are 20 to 30
  When I select boy's clothes with size 22
  Then the boy's clothes should fit the girl
  And I should be able to purchase them for the girl
Buying clothes for a boy using a girl's size (if the size fits):

Scenario: Buying clothes for a boy using a girl's size (if the size fits)
  Given I want to buy clothes for a boy
  And the available girl clothing sizes are 20 to 25
  When I select girl's clothes with size 24
  Then the girl's clothes should fit the boy
  And I should be able to purchase them for the boy
Not buying any clothes if none fit:

Scenario: Not buying any clothes if none fit
  Given I want to buy clothes for a boy
  And the available clothing sizes are outside the boy's size range
  When I select clothes with size 35
  Then the clothes should not fit the boy
  And I should not be able to purchase them