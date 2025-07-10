Feature: Buying clothes for a boy and a girl
  As a customer,
  I want to buy the right size clothes for a boy and a girl,
  So that I can fix them with the right size clothes.

Scenario Outline: Buying clothes based on size
  Given that the boy's size range is from <boy-size-min> to <boy-size-max>
  And the girl's size range is from <girl-size-min> to <girl-size-max>
  And I want to buy clothes for a boy and a girl
  When I add clothes for the boy with size <boy-size> 
  And I add clothes for the girl with size <girl-size>
  Then I should only be able to buy the clothes if the sizes are valid
  And the clothes should be bought only if they fit the correct gender

Examples:
  | boy-size-min | boy-size-max | girl-size-min | girl-size-max | boy-size | girl-size |
  | 20           | 30           | 20            | 25            | 22       | 22        |
  | 20           | 30           | 20            | 25            | 29       | 24        |
  | 20           | 30           | 20            | 25            | 31       | 22        |
  | 20           | 30           | 20            | 25            | 23       | 26        |
  | 20           | 30           | 20            | 25            | 20       | 24        |

Scenario: No clothes can be bought if sizes do not fit
  Given that the boy's size range is from 20 to 30
  And the girl's size range is from 20 to 25
  When I attempt to buy clothes for a boy with size 31
  And I attempt to buy clothes for a girl with size 26
  Then I should not be able to buy any clothes# Product Requirements Document: Smart Clothing Size Checker

## 1. Product Overview

### 1.1 Project Information
- Project Name: smart_clothing_size_checker
- Programming Language: React, JavaScript, Tailwind CSS
- Original Requirements: Create a system that helps users determine appropriate clothing sizes for boys and girls, with specific size ranges and cross-matching compatibility.

### 1.2 Product Goals
1. Simplify the clothing size selection process for children's wear
2. Reduce return rates by ensuring correct size selections
3. Maximize clothing utilization through cross-gender compatibility checks

### 1.3 User Stories
- As a parent, I want to check if a clothing size will fit my child so that I can make informed purchasing decisions
- As a shopper, I want to know if boy's clothes can fit a girl (or vice versa) so that I can maximize clothing options
- As a retail associate, I want to quickly validate size compatibility so that I can assist customers effectively
