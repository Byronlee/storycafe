def validate_field_type_default fields 
  fields.each do |e|
     validate_field_output e[0],e[1],e[2]
  end
end

def validate_field_output *arr
  it "having field named #{arr[0]} of type #{arr[1]} with default value of #{arr[2]}" do
    should have_fields(arr[0]).of_type(arr[1]).with_default_value_of(arr[2])
  end
end

def validate_created_at
  it "including Mongoid::Timestamps::Created " do
    should be_timestamped_document.with(:created)
  end

  it "do not include Mongoid::Timestamps::Created not Updated" do
    should_not be_timestamped_document.with(:updated)
  end

  it "having field named created_at whose type is Time " do
    should have_fields(:created_at).of_type(Time)
  end

  it "having field named created_at whose type is not Date" do
    should_not have_fields(:created_at).of_type(Date)
  end
end

def validate_id
  it "having no field named id but have _id " do 
    should_not have_field(:id)
  end
end
