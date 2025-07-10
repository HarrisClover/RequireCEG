Feature: Purchase Appropriate Clothes for Boy and Girl
  As a customer,
  I want to buy the right size clothes for a boy and a girl
  So that they both have clothes that fit appropriately.

  # Scenario: Purchase boy's and girl's clothes when both sizes are available
  Scenario: Buy individual clothes when sizes are available
    Given a boy's clothing size request of <boy-size>
    And a girl's clothing size request of <girl-size>
    When the system checks the available sizes
    Then the system allows the purchase if the boy's size is between 20 and 30
      And the girl's size is between 20 and 25

  # Scenario: Substitute girl's clothes for boy if they fit
  Scenario: Buy girl's clothes for the boy if they fit
    Given a boy's clothing size request of <boy-size>
    And the system does not have boy's clothes in the requested size
    When the system checks for a substitute using girl's clothes
    Then the system allows the purchase if the girl's clothing size fits the boy (between 20 and 25 and compatible with the boy's fit)

  # Scenario: Substitute boy's clothes for girl if they fit
  Scenario: Buy boy's clothes for the girl if they fit
    Given a girl's clothing size request of <girl-size>
    And the system does not have girl's clothes in the requested size
    When the system checks for a substitute using boy's clothes
    Then the system allows the purchase if the boy's clothing size fits the girl (between 20 and 30 and compatible with the girl's fit)

  # Scenario: No purchase if no appropriate size is found
  Scenario: Do not buy any cloth if the right size does not exist
    Given a boy's clothing size request of <boy-size>
    And a girl's clothing size request of <girl-size>
    When the system checks available sizes and substitutions
    Then the system should not allow the purchase if:
      | Condition                                      |
      | boy's size is not between 20 and 30            |
      | girl's size is not between 20 and 25           |
      | no suitable substitution (girl's for boy or boy's for girl) meets the fit requirements |
