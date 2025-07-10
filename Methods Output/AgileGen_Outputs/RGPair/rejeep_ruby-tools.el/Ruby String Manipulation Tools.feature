Feature: Ruby String Manipulation Tools  
As a Ruby developer,  
I want tools that enhance productivity for string manipulation,  
So that I can edit, convert, and manage strings more efficiently within my code.

Scenario Outline: Manipulating Strings in Ruby
Given that I am using the Ruby string tools  
And I have a string in my code  
When I apply actions such as clearing, converting, or interpolating strings  
Then the string should be correctly modified based on the action  
And the structure and integrity of the string should be maintained  

Examples:  
| Action           | Input String | Expected Result          | Description                                                                 |
|------------------|--------------|--------------------------|-----------------------------------------------------------------------------|
| Clear String     | "Hello World"| ""                       | Removes content while maintaining quote marks                                |
| Interpolation    | "Hello #{name}"| "Hello Alice"           | Interpolates a variable inside a double-quoted string                        |
| Convert to Symbol| "Hello"      | :Hello                   | Converts a string to a symbol                                               |
| Convert to String| :Hello       | "Hello"                  | Converts a symbol back to a string                                          |
| Clear Empty String| ""          | ""                       | Ensures that an empty string retains its structure without losing quotes      |