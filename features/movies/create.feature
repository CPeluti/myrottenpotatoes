Feature: Create Movie
    As a user
    I want to register a movie
    So that the system list my movie

    Scenario: Successfuly go to the create page
        Given I am on the index page
        When I click the create button
        Then I should be redirected to the create page
        And I should see the inputs