Feature: Receiving Tempting Rewards  
As a user,  
I want to be able to receive tempting rewards,  
So that I have a reason to use the website.  

Scenario Outline: Receive tempting rewards if I want to use the website  
Given I am logged into the website  
And I want to use the website  
When I complete my action on the website  
Then I should receive tempting rewards

Examples:  
| Want-to-use-website | Receive-reward |  
| Yes | Yes |  

Scenario Outline: Do not receive tempting rewards if I do not want to use the website  
Given I am logged into the website  
And I do not want to use the website  
When I visit the website  
Then I should not receive tempting rewards  

Examples:  
| Want-to-use-website | Receive-reward |  
| No | No |  

Scenario Outline: Do not receive tempting rewards if I want to use the website and do not want any reward  
Given I am logged into the website  
And I want to use the website  
And I do not want any reward  
When I complete my action on the website  
Then I should not receive tempting rewards  

Examples:  
| Want-to-use-website | Want-reward | Receive-reward |  
| Yes | No | No |  