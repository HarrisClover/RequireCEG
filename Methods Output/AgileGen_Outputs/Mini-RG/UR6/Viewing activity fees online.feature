Feature: Viewing activity fees online
  As a user,
  I want to view activity fees online
  So that I can easily create a bill statement or check fees availability

  Scenario Outline: Viewing activity fees online based on network conditions
    Given the network is <network-status>
    When I attempt to view all available activity fees online
    Then I should <view-activity-fees> activity fees online

  Examples:
    | network-status | view-activity-fees           |
    | up             | be able to view all           |
    | down           | not be able to view any       |

  Scenario Outline: Viewing activity fees based on bill creation plan
    Given I am planning to <bill-plan>
    When I attempt to view activity fees online
    Then I should <view-activity-fees> activity fees online

  Examples:
    | bill-plan             | view-activity-fees           |
    | create a bill statement | be able to view all           |
    | not create a bill statement | be able to view all         |
