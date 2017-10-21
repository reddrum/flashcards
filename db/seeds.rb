# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Card.destroy_all

url = 'http://1000mostcommonwords.com/1000-most-common-russian-words/'
html = open(url)

page = Nokogiri::HTML(html)
page.css('tbody tr').each do |tr|
  puts Card.create(original_text: "#{tr.css('td')[2].text}", translated_text: "#{tr.css('td')[1].text}")
end       

p "Created #{Card.count} cards"