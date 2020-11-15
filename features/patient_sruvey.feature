Feature: patients can log in and take surveys
  
  As a patient
  I can sign in to the system
  I want give feedback to patients surveys
  
Background: user accounts and surveys have been added to database
  
  Given the following users exist:
    |   role   |          email          | password |   full_name    |
    | admin    | admin@admin.com         | test123  | admin          |
    | provider | test@provider.com       | test123  | test_provider  |
    | provider | test2@provider.com      | test123  | test_provider_2|
    | provider | test3@provider.com      | test123  | test_provider_3|
    | patient  | test@patient.com        | test123  | test_patient   |
    | patient  | test2@patient.com       | test123  | test_patient_2 |

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
   Then I follow "Submit"
   Then I should see "Patient Panel"