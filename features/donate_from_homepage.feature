Feature: User should be able to donate directly from the homepage
  In order to donate from the homepage
  As a guest
  I should be able to see a donate form

  Scenario: View the homepage
    When I go to the homepage
    Then I should be able to see a donation form
