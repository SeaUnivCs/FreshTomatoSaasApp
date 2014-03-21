Feature: User can manually add movie

Scenario: Add a movie
  Given I am on the Fresh Tomato home page
  When I follow "Add a new movie"
  Then I should be on the create a new movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Create this movie"
  Then I should be on the Fresh Tomato home page
  And I should see "Men In Black"
