# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Page.delete_all
MovieGenre.delete_all
Genre.delete_all
Movie.delete_all
ProductionCompany.delete_all

filename = Rails.root.join("db/top_movies.csv")

puts "Loading Movies from the CSV file: #{filename}"

csv_data = File.read(filename)

movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |m|
  # puts m["original_title"]
  production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

  if production_company&.valid?
    movie = production_company.movies.create(
      title:        m["original_title"],
      year:         m["year"],
      duration:     m["duration"],
      description:  m["description"],
      average_vote: m["avg_vote"]
    )

    if movie&.valid?
      # if we just used the comma, we'll get a SPACE character in there. :(
      # the map(&:string), will take all the values from the split and remove all space characters!
      # The & symbol in this context says: collection.map { | collection_item | collection_item.strip }
      # called a TWO PROC... takes the symbol and turns it into the above!
      genres = m["genre"].split(",").map(&:strip)

      genres.each do |genre_name|
        genre = Genre.find_or_create_by(name: genre_name)

        # since the joiner table references the other 2 tables, we can just pass the objects:
        MovieGenre.create(movie: movie, genre: genre)
      end
    else
      puts "Invalid movie #{m['original_title']}"
    end
  else
    puts "Invalid Production Company: #{m['production_company']} for movie: #{m['original_title']}"
  end
end

Page.create(
  title:     "Contact Us",
  content:   "Want to give feedback? Email us at jk@gmail.com",
  permalink: "contact"
)

Page.create(
  title:     "About the data",
  content:   "DATA WAS STOLEN FROM IMDB KAGGLE",
  permalink: "about_the_data"
)

puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} movies."
puts "Created #{Genre.count} Genres"
puts "Created #{MovieGenre.count} Movie Genres"
