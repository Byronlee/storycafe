require "spec_helper"
describe "routing to stories" do

  it "routes get /logs/mark_read to logs#mark_read" do
    expect(:get => "/logs/mark_read").to route_to(
      :controller => "logs",
      :action     => "mark_read",
    )
  end
end

