require 'spec_helper'
describe GroupsController do

  before(:each) do 
    @groups = create_list(:group,2)
  end
   
  after :all do 
    FactoryGirl.reload
  end

  it "index" do
  end

  it "edit when params[:id] == current_group.id" do 
    get :edit,{id: @groups[0].id},{:current_group => @groups[0]}
    response_rspec(:index,"","200","text/html")
  end

  it "edit when params[:id] != current_group.id" do 
    get :edit,{id: @groups[0].id},{:current_group => @groups[1]}
    session[:current_group].id.should == @groups[0].id
    response_rspec(:index,"","200","text/html")
  end
  it "create" do
    xhr(:post,:create,:group => {title: "simlegate",description: "this is a group"})
    response_rspec(nil,Group.last.to_json,"200")
  end

  it "update" do
    xhr(:get,:update,{:group => {title: "simlegate",description: "this is a group"}, :id => @groups[0].id })
    response_rspec(nil,"true".to_json,"200")
  end
end
