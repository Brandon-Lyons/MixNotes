Feature: Users posts reply
  In order to respond to a comment
  As a user
  I want to post a reply

  Scenario: User posts a reply to a comment
    Given I am signed in
    And I have the following mixes:
      | title           | artist   | admin          |
      | Blue and Yellow | The Used | me@example.com |
    And I posted the following comments in mix "Blue and Yellow":
      | time | content            |
      | 0    | Great drum groove! |
    When I view mix "Blue and Yellow"
    And I fill in "reply_content" with "Totally!"
    And I click element "#new_reply > input[type="submit"]"
    And I should see "Totally!"
    And I should see "me@example.com"

  Scenario: User tries to post an empty reply
    Given I am signed in
    And I have the following mixes:
      | title         | artist    | admin          |
      | Ace of Spades | Motorhead | me@example.com |
    And I posted the following comments in mix "Ace of Spades":
      | time | content                 |
      | 0    | Check out Lemmy's mole! |
    When I view mix "Ace of Spades"
    And I click element "#new_reply input[type="submit"]"
    Then I should see "Please type your reply in the text box."