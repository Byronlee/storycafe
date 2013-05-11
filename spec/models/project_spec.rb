require 'spec_helper'
describe Project do

  context "field" do
    validate_created_at
    fields = [  
                [ :_id,Moped::BSON::ObjectId,nil],
                [ :user_id,Object,nil],
                [ :name,String,nil],
                [ :created_at,Time,nil]
             ]   
    validate_field_type_default fields
    it "have the relation n-1 between log and user" do
      should belong_to(:user).of_type(User).with_foreign_key(:user_id)
     end
  end
  
  context "function test" do
    before(:all) do
      Project.destroy_all
      @project = create(:project) 
    end

    it "create project" do
      pending("create project is not tested")
    end

    it "get default project which first project" do
      Project.get_default_project.name.should == @project.name 
    end
  end
end

