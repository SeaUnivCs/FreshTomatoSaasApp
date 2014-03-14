Feature: User can manually add movie

Scenario: Add a movie
  Given I am on the Fresh Tomato home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Men In Black"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the Fresh Tomato home page
  And I should see "Men In Black"
