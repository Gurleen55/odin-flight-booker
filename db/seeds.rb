# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[
  { name: "Calgary International Airport", city: "Calgary", code: "YYC" },
  { name: "Gander International Airport", city: "Gander", code: "YQX" },
  { name: "Montreal-Trudeau International Airport", city: "Montreal", code: "YUL" },
  { name: "Halifax International Airport", city: "Halifax", code: "YHZ" },
  { name: "Toronto Pearson Airport", city: "Toronto", code: "YYZ" }
].each do |attributes|
  Airport.find_or_create_by!(attributes)
end
