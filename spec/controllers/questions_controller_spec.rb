require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
before do
    # create the user and sign in
    @user = User.create!({:email => "test1@test.com", :role => "patient", :password => "111111", :password_confirmation => "111111", :full_name => "test1" })
    
    # create questions
    Question.create(id: 1, name: 'testPatient', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,17),
        updated_at: Date.new(2020,11,17), user_id: 1, patient_id: @user.id, feedback: 'feedback 1')
    
    Question.create(id: 2,name: 'testPatient', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 2, created_at: Date.new(2020,11,18),
        updated_at: Date.new(2020,11,18), user_id: 1, patient_id: @user.id, feedback: 'feedback 2')
    
    Question.create(id:3,name: 'testPatient', mrn: 'MRN2', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 4, created_at: Date.new(2020,11,19),
        updated_at: Date.new(2020,11,19), user_id: 1, patient_id: @user.id, feedback: 'feedback 3')
    
    Question.create(id: 4,name: 'testPatient', mrn: 'MRN3', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 6, created_at: Date.new(2020,11,20),
        updated_at: Date.new(2020,11,20), user_id: 1, patient_id: @user.id, feedback: 'feedback 4')
        
    @questions = Question.all()
  end
  
describe "Patient Login and survey Strategy populate" do
    it 'should answer differently on question6, case 1' do
      sign_in @user
      get :dashboard, :format => "1"
      
      expect(assigns(:patient).question6).to eq(1)
    end
    
    it 'should answer differently on question6, case 2' do
      sign_in @user
      get :dashboard, :format => "2"
      expect(assigns(:patient).question6).to eq(2)
      
    end
    
    it 'should answer differently on question6, case 3' do
      sign_in @user
      get :dashboard, :format => "3"

      expect(assigns(:patient).question6).to eq(4)
    end
    
    it 'should answer differently on question6, case 4' do
      sign_in @user
      get :dashboard, :format => "4"
      
      expect(assigns(:patient).question6).to eq(6)
      
    end
end
end
