Feature: Manage movies in RottenPotatoes
  As a movie fan
  I want to view details and remove movies
  So that I can keep the database accurate

  Background: movies have been added to database
    Given the following movies exist:
      | title        | rating | release_date |
      | Aladdin      | G      | 25-Nov-1992  |
      | The Help     | PG-13  | 10-Aug-2011  |

  Scenario: View movie details
    Given I am on the RottenPotatoes home page
    When I follow "More about Aladdin"
    Then I should be on the details page for "Aladdin"
    And I should see "Rating: G"
    And I should see "Released on: November 25, 1992"

  Scenario: Delete a movie
    Given I am on the details page for "The Help"
    When I press "Delete"
    Then I should be on the RottenPotatoes home page
    And I should see "Movie 'The Help' deleted."
    And I should not see "More about The Help"