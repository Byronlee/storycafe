require "spec_helper"
def restful_routing controller
 describe "restful" do
  it "routes get /#{controller} to #{controller}#index" do
    expect(:get => "/#{controller}").to route_to(
      :controller => "#{controller}",
      :action     => "index"
    )
  end

  it "routes post /#{controller} to #{controller}#create" do
    expect(:post => "#{controller}").to route_to(
      :controller => "#{controller}",
      :action     => "create"
    )
  end

  it "routes get /#{controller}/:id/edit to #{controller}#edit" do
    expect(:get => "/#{controller}/123456/edit").to route_to(
      :controller => "#{controller}",
      :action     => "edit",
      :id         => "123456"
    )
  end

  it "routes delete /#{controller}/:id to #{controller}#destroy" do
    expect(:delete => "#{controller}/123456").to route_to(
      :controller => "#{controller}",
      :action     => "destroy",
      :id         => "123456"
    )
  end

  it "routes get /#{controller}/:id to #{controller}#show" do
    expect(:get => "/#{controller}/123456").to route_to(
      :controller => "#{controller}",
      :action     => "show",
      :id         => "123456"
    )
  end

  it "routes put /#{controller}/:id to #{controller}#update" do
    expect(:put => "/#{controller}/123456").to route_to(
      :controller => "#{controller}",
      :action     => "update",
      :id         => "123456"
    )
  end

  it "routes get /#{controller}/new to #{controller}#new" do
    expect(:get => "/#{controller}/new").to route_to(
      :controller => "#{controller}",
      :action     => "new",
    )
  end
 end
end

