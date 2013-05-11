require 'spec_helper'
describe ProjectsController do

  before (:each) do 
    User.destroy_all
    Project.destroy_all
    @projects  = create_list(:project,2) 
    @user = create(:user)
  end

  after :all do 
    FactoryGirl.reload
    sign_out @user
  end

  it "create when having other project " do
    # for current_user
    sign_in @user
    xhr :post,:create,:project => {name: @projects[1].name},current_project: @projects[0] 
    session[:current_project].should_not == @projects[0]
    session[:current_project].should == Project.last
    response_rspec(nil,session[:current_project].to_json,"200")
  end

end
