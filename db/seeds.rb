# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

artists_csv = CSV.readlines("db/artists.csv")
artists_csv.shift
artists_csv.each do |row|
  Artist.create(name: row[1], image_url: row[2])
end