require 'rubygems'
require 'sinatra'
require "sequel"
require "haml"

set :views, File.dirname(__FILE__) + "/views"

DB = Sequel.connect('sqlite://autocomplete.db')
items = DB[:items]

get "/" do
  haml :form
end

post "/autocomplete" do
  @items = items.select(:name)
    .where(
      Sequel.like(:name, "#{params[:search].downcase}%")
    )
    .map(:name)
  haml :got
end
