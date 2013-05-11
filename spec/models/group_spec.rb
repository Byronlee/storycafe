require 'spec_helper'
describe Group do
  before :all do 
    Group.destroy_all
    @groups = create_list(:group,2)  
  end

  # clear factory and sequence etc
  after :all do 
    FactoryGirl.reload
  end

  describe "fields" do
    fields = [  
                [ :_id,Moped::BSON::ObjectId,nil],
                [ :user,String,nil],
                [ :title,String,nil],
                [ :description,String,nil],
                [ :created_at,Time,nil]
             ]
    validate_field_type_default fields
    validate_created_at
    validate_id
    it "have relation of 1-n between Group and stories" do 
      should have_many(:stories).with_foreign_key(:group_id)
    end
  end

  describe "has a number of class methods including" do 
    it "creating a new group" do
      expect(Group.add_group(attributes_for(:group)).title).to eq("public#{@groups.length+1}")
    end
        
    context "getting default group" do 
      it "when the public group is not nil" do
        @groups[0].should_not be_nil 
      end

      it "when the title of default group is public" do 
        expect(Group.get_default_group).to eq(@groups[0])
      end
    end

    it "getting group by group id" do
       expect(Group.get_group_by_group_id(@groups[1].id).description).to eq(@groups[1].description)
    end
  end
end  
