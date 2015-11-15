# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

songs_csv = CSV.readlines("db/songs.csv")
songs_csv.shift
songs_csv.each do |row|
  Song.create(name: row[1], artist_id: row[2], display: row[5])
end