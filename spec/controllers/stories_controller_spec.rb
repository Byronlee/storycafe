require 'spec_helper'
describe StoriesController do
 
  before (:all) do 
    @stories   = create_list(:story,2)
    @user = create(:user)
  end

  after (:all) do 
    sign_out @user
    FactoryGirl.reload
  end

  it "index" do
    sign_in @user
    get "index"
    response_rspec(:index,"","200","text/html")
  end

  it "create" do
    sign_in @user
    xhr(:post,:create,story: {title: "Hello World"})
    response_rspec(:_every_story_in_table,"","200","text/html")
  end

  it "edit when params[:id] == current_story.id" do
    sign_in @user
    get :edit,{id: @stories[0].id},{:current_story => @stories[0]}
    response_rspec(nil,"","300","text/html")
  end

  it "edit when params[:id] != current_story.id" do
    sign_in @user
    get :edit,{id: @stories[0].id},{:current_story=> @stories[1]}
    session[:current_story].id.should == @stories[0].id
    response_rspec(:index,"","200","text/html")
  end

  it "update" do
    sign_in @user
    xhr(:put,:update,{id: @stories[0].id,description: "I am testing update"})
    expect(Story.find(@stories[0].id).description).to eq("I am testing update")
    response_rspec(nil,"autosave success!".to_json,"200")
  end

  it "change_status" do
    sign_in @user
    xhr(:get,:change_status,{story_id: @stories[0].id,next_status: :finished})   
    Log.find_by(content: "this is story be to finished by #{@user.email}").should be_valid 
    response_rspec(nil,"success","200")
  end
end
