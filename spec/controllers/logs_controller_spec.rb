require 'spec_helper'
describe LogsController do

  before :each do 
    @log = create(:log)
  end

  after :all do 
    FactoryGirl.reload
  end

  it "mark the log read" do 
    xhr(:get,:mark_read,{:id => @log.id}) 
    response_rspec(nil,"true","200")    
  end 
end
