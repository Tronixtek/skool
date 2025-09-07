Feature: Coach reviews learner reports for quizzes
  Coach needs to be able to see the quiz report details with the progress and score for each learner

  Background:
    Given I am logged in as a coach
      And I am at *Coach - '<class>' > Quizzes*
      And there are multiple quizzes assigned to a class, group, individual recipients
      And there are quizzes with all three completion statuses

  Scenario: Coach can review a quiz report
    When I click on the title of a quiz
    Then I see the quiz details page
    	And I see the quiz title, the *Preview* button and the *...* button next to it
    	And I see the side panel with *Recipients*, *Average score*, *Report visibility*, *Class*, *Section order*, *Size*, *Date created*
    	And I see the *Learners* tab with the learners table
    	And there are the following columns: *Name*, *Progress*, *Sore* and *Groups*
    	And I see the *Difficult questions* tab
    When I click on the name of a learner who has completed the quiz
    Then I see the quiz score card
    	And I can see the *Answer history* of the learner
    When I click the back arrow
    Then I am back at the quiz details page
    When I click on the *Difficult questions* tab
    Then I see a table with the difficult questions
    	And I see the following columns: *Question*, *Help needed*

  Scenario: Coach can can export quiz report data as CSV
  	Given I am at the quiz details page for a quiz assigned to a class with learners
  		And there are learners who have not started, started or completed a quiz
  	When I click the *Export as CSV* icon
  		And I save the exported CSV file to the device
  		And I open the CSV file to see the data
  	Then I see a CSV file containing all of the available learner data in the following columns: *Name*, *Progress*, *Score*, *Answered*, *Questions*, *Total questions*, *Groups*

  Scenario: Report has the average score
    Given that <quiz> has at least one learner who completed it
    When I look high level summary
    Then I see the *Average score* reports just the average of those learners' scores

  Scenario: Review quiz attempt report for a learner
    Given that I am on the <quiz> *Report* subtab
    When I click on the <learner> name
    Then I see the attempt report of the <learner> for each question in the <quiz>

  Scenario: Review DIFFICULT QUESTIONS subtab
    Given that I am on the <quiz> *Report* subtab
    When I click on *Difficult questions* subtab
    Then I see a list of the most difficult quiz questions

  Scenario: Review single difficult question
    Given that I am on the *Difficult questions* subtab
    When I click into a <question> question
    Then I see the *'<question>'* question page
      And I see each learner who has had trouble answering <question>

  Scenario: Review attempts by different learners on the difficult question page
    Given that I am on the difficult *'<question>'* question page
    When I click between different learner names on the sidebar
    Then I see each learner’s attempt on the <question>

  Scenario: Only assigned learners appear in the reports
    When <quiz> is assigned to <groups>
    Then only learners in <groups> appear in the reports

  Scenario: Viewing reports not organized by learner groups
    When the *View by groups* checkbox is unchecked
    Then all the learners appear in a single report table
      And all the learners are sorted alphabetically by their full name

  Scenario: Viewing reports organized by learner groups
    When the *View by groups* checkbox is checked
    Then the learners in each group appear in separate tables
      And the groups are sorted alphabetically
      And all learners are sorted alphabetically by their full name

  Scenario: A learner has not started a quiz
    When a learner has not started the <quiz>
      And they have all the questions remaining
    Then the learner's *Progress* column says *Has not started*
      And their *Score* column is blank

  Scenario: A learner has started a quiz
    When a learner has started the <quiz>
      And they have some of the questions remaining
    Then the learner's *Progress* column displays *X of Y questions answered*
      And their *Score* column is blank

  Scenario: A learner has completed a quiz
    When a learner has completed the <quiz>
    Then their *Progress* column says *Completed*
      And their *Progress* column says *N questions answered* or *All questions answered*
      And their *Score* column shows the final score
