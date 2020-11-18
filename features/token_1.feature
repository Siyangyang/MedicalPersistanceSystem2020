Feature: token feature for covering feedback suggestions page
  
  I'm a bunch of token feature
  I'm here to increase the cover rate
  
Background: user accounts and surveys have been added to database
  
  Given the following users exist:
    |   role   |          email          | password |   full_name    |
    | admin    | admin@admin.com         | test123  | admin          |
    | provider | test@provider.com       | test123  | test_provider  |
    | provider | test2@provider.com      | test123  | test_provider_2|
    | provider | test3@provider.com      | test123  | test_provider_3|
    | patient  | test@patient.com        | test123  | test_patient   |
    | patient  | test2@patient.com       | test123  | test_patient_2 |
    | patient  | test3@patient.com       | test123  | test_patient_3 |
  
  Given the following questions exist:
    |   name         |    mrn     | age | question2 | question3 | question4 | question51 | question52 | question53 | question54 | question55 | question56 | question6 | provider_name   | patient_id | feedback                |
    | test_patient   | MRNtest1   |  32 |         2 |         2 | t         |          2 |          2 |          1 |          1 |          3 |          3 |         1 | test_provider   |            | This is a test feedback |
    | test_patient_2 | MRNtest3   |  32 |         2 |         2 | t         |          2 |          2 |          1 |          1 |          3 |          3 |         4 | test_provider_2 |            | This is a test feedback |
    | test_patient_3 | MRNtest3   |  32 |         2 |         2 | t         |          2 |          2 |          1 |          1 |          3 |          3 |         6 | test_provider_3 |            | This is a test feedback |
    
  Scenario: Patient can Log in and view their feedback
   When I am on the login page
   And I fill in "inputEmail" with "test@patient.com"
   And I fill in "inputPassword" with "test123"
   Then I press "Log in"
   Then I am on the patient panel page
   Then I should see "Patient Panel"
   Then I follow "View Feedback"
   Then I should see "This is a test feedback"
   
  Scenario: Patient can Log in and view their feedback
   When I am on the login page
   And I fill in "inputEmail" with "test2@patient.com"
   And I fill in "inputPassword" with "test123"
   Then I press "Log in"
   Then I am on the patient panel page
   Then I should see "Patient Panel"
   Then I follow "View Feedback"
   Then I should see "This is a test feedback"
   
  Scenario: Patient can Log in and view their feedback
   When I am on the login page
   And I fill in "inputEmail" with "test3@patient.com"
   And I fill in "inputPassword" with "test123"
   Then I press "Log in"
   Then I am on the patient panel page
   Then I should see "Patient Panel"
   Then I follow "View Feedback"
   Then I should see "This is a test feedback"
   
Scenario: Patient can Log in and take survey
   When I am on the take survey page
   And I fill in "inputEmail" with "test@patient.com"
   And I fill in "inputPassword" with "test123"
   Then I press "Log in"
   Then I should see "New Survey"
   And I select "2" from "question_user_id"
   And I fill in "question_mrn" with "123"
   And I fill in "question_age" with "50"
   And I choose "Much Lower"
   And I choose "Not at all"
   And I choose "Yes"
   And I choose "question_question51_1"
   And I choose "question_question52_1"
   And I choose "question_question53_1"
   And I choose "question_question54_1"
   And I choose "question_question55_1"
   And I choose "I do not think I need treatment for osteoporosis."
   And I press "Submit Response"
   Then I should see "Confirm Response"
   Then I should see "MRN: 123"
   Then I follow "Edit Response"
   Then I should see "Edit Response"
   And I choose "question_question51_2"
   And I press "Submit Response"