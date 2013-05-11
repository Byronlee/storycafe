require 'spec_helper'

describe User do
  context "field" do 
    # test custom fields besides devise 
    fields = [  
                [ :name,String,nil],
                [ :sex,String,nil],
             ]
    validate_field_type_default fields
    it "the relation between User and Story is 1-n" do 
      should have_many(:stories).with_foreign_key(:user_id)
    end

    it "the relation between User and Project is 1-n" do 
      should have_many(:projects).with_foreign_key(:user_id)
    end

    it "the relation between User and log  is 1-n" do 
      should have_many(:logs).with_foreign_key(:user_id)
    end
  end
  
end

