require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
before do
    # create the user and sign in
    @user = User.create!({:email => "test1@test.com", :role => "patient", :password => "111111", :password_confirmation => "111111", :full_name => "test1" })
    
    # create questions
    Question.create(id: 1, name: 'testPatient', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,17),
        updated_at: Date.new(2020,11,17), user_id: 1, patient_id: @user.id, feedback: 'feedback 1')
    
    # Question.create(name: 'test1', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
    #     question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,18),
    #     updated_at: Date.new(2020,11,18), user_id: 1, patient_id: @user.id, feedback: 'feedback 2')
    
    # Question.create(name: 'test2', mrn: 'MRN2', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
    #     question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,19),
    #     updated_at: Date.new(2020,11,19), user_id: 1, patient_id: 3, feedback: 'feedback 3')
    
    # Question.create(name: 'test3', mrn: 'MRN3', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
    #     question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,20),
    #     updated_at: Date.new(2020,11,20), user_id: 1, patient_id: 4, feedback: 'feedback 4')
        
    @questions = Question.all()
  end
  
describe "Feedback Stragtegy" do
    it 'should output correct user stage on Feedback page, case 1' do
      sign_in @user
      get :dashboard, :format => "1"
      
      expect(assigns(:patient).question6).to eq(1)
        end
    end
end
