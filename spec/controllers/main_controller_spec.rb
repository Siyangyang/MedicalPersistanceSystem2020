require 'rails_helper'

RSpec.describe MainController, type: :controller do
  
  before do 
    visit root_path
  end
  
  describe "go to the home page" do
    it "be on the home page" do
      expect(current_path).to eq root_path
    end
  end
end
