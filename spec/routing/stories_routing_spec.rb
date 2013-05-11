require "spec_helper"
require File.expand_path("../restful_routing_spec", __FILE__)
describe "routing to stories" do

  restful_routing :stories

  it "routes get /stories/change_status to stories#change_status" do
    expect(:get => "/stories/change_status").to route_to(
      :controller => "stories",
      :action     => "change_status",
    )
  end
end

