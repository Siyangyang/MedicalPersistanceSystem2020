Feature: Log in and give feedback to surveys of the current provider's patients in the provider panel
  
  As a provider
  So that I can sign in to the system
  I want give feedback to patients surveys
  Patient should be able to see the feedback I gave
  
Background: user accounts and surveys have been added to database
  
  Given the following users exist:
    |   role   |          email          | password |   full_name    |
    | admin    | admin@admin.com         | test123  | admin          |
    | provider | test@provider.com       | test123  | test_provider  |
    | provider | test2@provider.com      | test123  | test_provider_2|
    | provider | test3@provider.com      | test123  | test_provider_3|
    | patient  | test@patient.com        | test123  | test_patient   |
    | patient  | test2@patient.com       | test123  | test_patient_2 |
  
  Given the following questions exist:
    |   name         |    mrn     | age | question2 | question3 | question4 | question51 | question52 | question53 | question54 | question55 | question56 | question6 | provider_name   | patient_id | feedback                |
    | test_patient   | MRNtest1   |  32 |         2 |         2 | t         |          2 |          2 |          1 |          1 |          3 |          3 |         3 | test_provider   |            |                         |
    | test_patient_2 | MRNtest3   |  32 |         2 |         2 | t         |          2 |          2 |          1 |          1 |          3 |          3 |         3 | test_provider_2 |            | This is a test feedback |


  Scenario: Provider can Log in and give feedback
   When I am on the login page
   And I fill in "inputEmail" with "test@provider.com"
   And I fill in "inputPassword" with "test123"
   Then I press "Log in"
   Then I am on the provider panel page
   Then I should see "Provider Panel"
   Then I follow "Edit Feedback"
   And I fill in "feedback" with "This is a test feedback"
   And I press "Update Feedback"
   Then I am on the provider panel page
   Then I follow "Edit Feedback"
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