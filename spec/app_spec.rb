require_relative 'spec_helper'

describe "Autocomplete sirvice" do
  it "should return page at /" do
    get '/' 
    last_response.body.should include('Autocomplete example' )
  end

  it "should return array on POST to /autocomplete" do
    post '/autocomplete', { :search => 'a'}
    eval(last_response.body).should be_a_kind_of(Array)
  end

  it "should return array of 3 elements on POST to /autocomplete" do
    post '/autocomplete', { :search => 'c'}
    eval(last_response.body).should have(5).strings
  end
end
