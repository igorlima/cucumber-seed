Feature: Greeting
  Scenario: Greet the User
    When I type "Igor" in the "Name" text field
    And I click the "Greet" button
    Then I should see an alert with the message: "Hello Igor!"
    
   Scenario: Forgot Name
      When I click the "Greet" button
      Then I should see an alert with the message: "Your name is required!"
