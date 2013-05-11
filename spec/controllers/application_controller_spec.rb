require "spec_helper"
describe ApplicationController do 
  controller do 
    def index
      render "stories/index"
    end
  end
  before :all do 
    Project.destroy_all
    Group.destroy_all
    @groups = create_list(:group,10)
    create_list(:story, 10,group: @groups[0])
    @projects = create_list(:project,2)
  end
  after :all do 
    FactoryGirl.reload
  end
  it "invoke init" do 
    get :index
    session[:current_group].should_not be_nil
    session[:current_story].should_not be_nil
  end

  context "get next status" do 
    it "when Rails.configuration.status is ['new','started','review','finished']" do 
      Rails.configuration.status.should == ['new','started','review','finished']
    end

    it "by current status whose value is new" do 
      @controller.get_next_status("new").should == "started"
    end

    it "by current status whose value is started" do 
      @controller.get_next_status("started").should == "review"
    end

    it "by current status whose value is review" do 
      @controller.get_next_status("review").should == "finished"
    end

    it "by current status whose value is finished" do 
      @controller.get_next_status("finished").should == "finished"
    end
  end

  context "get current project" do 
     it "when current project is nil" do
       get :index,{},{current_project: nil}  
       @controller.current_project.should == @projects[0] 
     end
     
     it "when current project is not nil" do
       get :index,{},{current_project: @projects[1]}  
       @controller.current_project.should == @projects[1] 
     end
  end
   
  context "get channel path" do 
    it "and the path in config/application.rb is not null" do 
      Rails.configuration.channel_prefix.should == "/channels"
    end

    it "and current_project exixts" do 
      get :index,{},{current_project: @projects[0]}
      @controller.get_channel_path.should == "/channels/#{@projects[0].id}" 
    end
  end
end
