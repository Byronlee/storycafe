require 'spec_helper'
describe Log do

  context "field" do
    validate_created_at
    fields = [  
                [ :_id,Moped::BSON::ObjectId,nil],
                [ :user_id,Object,nil],
                [ :content,String,nil],
                [ :isread,Boolean,false],
                [ :created_at,Time,nil]
             ]
    validate_field_type_default fields
    it "have the relation n-1 between log and user" do
      should belong_to(:user).of_type(User).with_foreign_key(:user_id)
     end
  end

  context "function test" do
    before (:each) do
      Log.destroy_all
      @log = create(:log)
    end
     
    it "create new message" do
      attribute = attributes_for(:log) 
      expect(Log.new_message(attribute[:content]).content).to eq(attribute[:content])
    end

    it "set message isread" do 
      Log.set_message_isread(@log.id).should be_true
    end

    it "set message isread=false" do 
      Log.set_message_isread(@log.id,false).should be_true
    end

    it "get unread message" do
      Log.get_unread_message.should be_valid
    end
  end

end
