require 'spec_helper'
describe Story do
  
  describe "field" do
    # test field 'created_at'
    validate_created_at
    fields = [  
                [ :_id,Moped::BSON::ObjectId,nil],
                [ :user,String,nil],
                [ :title,String,nil],
                [ :description,String,nil],
                [ :list_id,Integer,nil],
                [ :current_status,String,"new"],
                [ :next_status,String,"started"],
                [ :created_at,Time,nil]
             ]   
    validate_field_type_default fields
    it "hava relation of n-1 between stories and group" do
    should belong_to(:group)
    end

    it "hava relation of n-1 between stories and user" do
    should belong_to(:user)
    end
  end  
  
  describe "function" do 

    before (:all) do
       Story.destroy_all
       Group.create(title: "public")
       @story = create(:story)
    end

    context "get stories by group id " do
      
      before (:all) do
        @s = Story.get_stories_by_group_id(@story.group.id)
      end

      it "hash.length should == 4" do
        @s.length.should == 4 
      end
     
      it "type of result is Hash" do 
        @s.should be_instance_of Hash
      end 

      it "should hava key new,started,review,finished" do
        Rails.configuration.status.each do |c|
          @s.should have_key(c.to_sym)
        end
      end

    end
    it "create a story" do 
      Story.add_story(attributes_for(:story)).should be_valid     
    end

    it "get stories of default group" do
      stories = Group.get_default_group.stories
      expect(Story.get_default_stories).to eq(stories)
    end
    
    it "get story by story id" do
      expect(Story.get_story_by_story_id(@story.id)).to eq(@story)
    end

    it "set story status and return modified story" do
      Story.set_story_status(@story.id,"review","new").should == @story 
    end

    it "get stories by groupid and current status " do
     # expect(Story.get_stories_by_groupid_and_current_status(@story.group_id,"new")).to eq(@story)
     Story.get_stories_by_groupid_and_currentstatus(@story.group_id,"new").should include(@story)
    end
  end
end

