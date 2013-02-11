Feature: create and delete movie
 
  As a responsible developer
  So that I can quickly create and delete movies
  I want to be able to create and delete movies

Background:  movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: movie created
  Given I am on the RottenPotatoes home page
  And I follow "Add new movie"
  And I fill in "Title" with "Movie Title"
  And I fill in "Director" with "Movie Director"
  When I press "Save Changes"
  Then I should see "Movie Title was successfully created."

Scenario: movie deleted
  Given I am on the RottenPotatoes home page
  And I follow "More about Star Wars"
  When I press "Delete"
  Then I should be on the home page
  And I should see "Movie 'Star Wars' deleted."
