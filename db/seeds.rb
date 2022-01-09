# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Avenger.destroy_all

puts "populating db"

url = "http://gateway.marvel.com/v1/public/characters?apikey=1e229818860f7081c532e634d8f6ae65&ts=1504796200286&hash=e02be810b65957f4b60b71ca89b8835f"

marvel_serialized =  URI.open(url).read

json = JSON.parse(marvel_serialized)

database = json['data']['results']


database.each do |avenger|
    if avenger["name"].match?(/(\([^)]*\))/)
        real_name = avenger["name"].scan(/\([^)]*\)/).last.delete('()')
        superheroname_clean = avenger["name"].gsub!(/(\([^)]*\))/, "").chop
        Avenger.create(
            superhero_name: superheroname_clean,
            real_name: real_name,
            description: avenger["description"]
        )
    else
        Avenger.create(
            superhero_name: avenger["name"],
            description: avenger["description"]
        )
    end
end

puts "all avengers have been created"