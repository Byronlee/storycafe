def response_rspec tmp={},body="",code="200",header="application/json"
  response.should render_template(tmp)
  response.body.should == body
  response.header["Content-Type"].should == "#{header}; charset=utf-8" 
  response.code.should == code 
end
