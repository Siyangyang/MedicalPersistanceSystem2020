require 'rails_helper'

RSpec.describe ProviderController, type: :controller do
before do
    # create the user and sign in
    @user = User.create!({:email => "test1@provider.com", :role => "provider", :password => "111111", :password_confirmation => "111111", :full_name => "testProvider" })
    @user2 = User.create!({:email => "test1@patient.com", :role => "patient", :password => "111111", :password_confirmation => "111111", :full_name => "testPatient" })
    # create questions
    Question.create(id: 1, name: 'testPatient', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 1, created_at: Date.new(2020,11,17),
        updated_at: Date.new(2020,11,17), user_id: @user.id, patient_id: @user2.id, feedback: 'feedback 1')
    
    Question.create(id: 2,name: 'testPatient', mrn: 'MRN1', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 2, created_at: Date.new(2020,11,18),
        updated_at: Date.new(2020,11,18), user_id: @user.id, patient_id: @user2.id, feedback: 'feedback 2')
    
    Question.create(id:3,name: 'testPatient', mrn: 'MRN2', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 4, created_at: Date.new(2020,11,19),
        updated_at: Date.new(2020,11,19), user_id: @user.id, patient_id: @user2.id, feedback: 'feedback 3')
    
    Question.create(id: 4,name: 'testPatient', mrn: 'MRN3', age: 12, question2: 1, question3: 1, question4: 1, question51: 1,
        question52: 1, question53: 1, question54: 1, question55: 1, question56: 1, question6: 6, created_at: Date.new(2020,11,20),
        updated_at: Date.new(2020,11,20), user_id: @user.id, patient_id: @user2.id, feedback: 'feedback 4')
        
    @questions = Question.all()
  end

  describe "view the historical surveys" do
    it 'should show all records of this patient' do
      sign_in @user
      
      get :index
      
      # check the number of previous surveys
      expect(assigns(:questions).count()).to eq(Question.where(user_id: @user.id).count())
      
      # check the occurred records belongs to the current user
      assigns(:questions).each do |question|
        expect(question.patient_id).to eq(@user2.id)
        expect(question.name).to eq(@user2.full_name)
      end
    end
  end
  
  describe "update the feedback" do
    it 'should update the feedback' do 
      sign_in @user
      
      post :update_feedback, :questions_id => 1
      
      
      @attr = {:feedback => "new feedback" }
      put :update_feedback, :questions_id => 1, :feedback => @attr
      
      expect(flash[:notice]).to match("Feedback was successfully updated.")
      response.should redirect_to('/provider/index')
    end
  end
  
  describe "Feedback Stragtegy" do
    it 'should output correct user stage on Feedback page, case 1' do
      sign_in @user
      get :edit_feedback, :format => "1"
      
      # file = instance_double(File)
      # allow(File).to receive(:read).with('config/counsel_points.json') 
      
      expect(assigns(:patient).question6).to eq(1)
      
    end
    
    it 'should output correct user stage on Feedback page, case 2' do
      sign_in @user
      get :edit_feedback, :format => "2"
      expect(assigns(:patient).question6).to eq(2)
      
    end
    
    it 'should output correct user stage on Feedback page, case 3' do
      sign_in @user
      get :edit_feedback, :format => "3"

      expect(assigns(:patient).question6).to eq(4)
    end
    
    it 'should output correct user stage on Feedback page, case 4' do
      sign_in @user
      get :edit_feedback, :format => "4"
      
      expect(assigns(:patient).question6).to eq(6)
      
    end
  end

  
end
