require 'rubygems'
require 'sequel'

DB = Sequel.connect('sqlite://autocomplete.db')
DB.create_table! :items do
  primary_key :id
  String :name
  Integer :rating
end

items = DB[:items]

["ActionScript","AppleScript","Asp","BASIC","C","C++","Clojure","COBOL",
 "ColdFusion","Erlang","Fortran","Groovy","Haskell","Java","JavaScript",
 "Lisp","Perl","PHP","Python","Ruby","Scala","Scheme"]
 .each do |lang|
  items.insert(:name => lang.downcase, :rating => rand(10..100))
end
