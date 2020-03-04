Feature: Search by keyword

  @cucumber
  Scenario: Searching for a term
    Given Sergey is on the DuckDuckGo home page
    When he searches for "cucumber"
    Then all the result titles should contain the word "cucumber"

  @gherkin
  Scenario: Searching for a gherkin
    Given Sergey is on the DuckDuckGo home page
    When he searches for "awesome"
    Then all the result titles should contain the word "awesome"