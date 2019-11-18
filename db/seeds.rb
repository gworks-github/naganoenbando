# coding: utf-8

# Customer
10.times do |n|
  first_name = Gimei.first.kanji
  last_name = Gimei.last.kanji
  first_furigana = Gimei.first.katakana
  last_furigana = Gimei.last.katakana
  post_code = "000-0000"
  address = Gimei.address.kanji
  phone_number = "0000000000"
  email = "#{n+1}@gmail.com"
  password = "password"

  Customer.create!(
  first_name: first_name,
  last_name: last_name,
  first_furigana: first_furigana,
  last_furigana: last_furigana,
  post_code: post_code,
  address: address,
  phone_number: phone_number,
  email: email,
  password: password)
end

#Item
I18n.locale = 'ja'
10.times do |n|
  name  = Faker::Music.album
  format = "True"
  artist_id = "#{n+1}"
  jacket_image_id = "#{n+1}"
  genre_id = "#{n+1}"
  label_id = "#{n+1}"
  quantity = "#{n+1}"
  release_date = "2019/11/1"
  is_selling = "True"
  prices  = "#{n+1}"
  tax_id  = 1

  Item.create!(
  name: name,
  format: format,
  artist_id: artist_id,
  jacket_image_id: jacket_image_id,
  genre_id: genre_id,
  label_id: label_id,
  quantity: quantity,
  release_date: release_date,
  is_selling: is_selling,
  prices: prices,
  tax_id: tax_id)
end


Disk.create!(
   item_id: '1',
   disk_number: '1',
   quantity: '10',
)

Track.create!(
   disk_id: '1',
   track_number: '1',
   name: '夏',
)

10.times do |n|
  name = Faker::Track.name
  Track.create!(name: name)
end

# artist
10.times do |n|
  name  = Faker::Artist.name
  Artist.create!(name: name)
end

# label
10.times do |n|
  name = Faker::Food.dish
  Label.create!(name: name)
end

# genre
10.times do |n|
  name = Faker::Music.genre
  Genre.create!(name: name)
end

# deliveries
10.times do |n|
  customer_id = "#{n+1}"
  first_name = Gimei.first.kanji
  last_name = Gimei.last.kanji
  first_furigana = Gimei.first.katakana
  last_furigana = Gimei.last.katakana
  post_code = "000-0000"
  address = Gimei.address.kanji
  phone_number = "0000000000"

  Delivery.create!(
  customer_id: customer_id,
  first_name: first_name,
  last_name: last_name,
  first_furigana: first_furigana,
  last_furigana: last_furigana,
  post_code: post_code,
  address: address,
  phone_number: phone_number)
end

10.times do |n|
  customer_id = "2"
  first_name = Gimei.first.kanji
  last_name = Gimei.last.kanji
  first_furigana = Gimei.first.katakana
  last_furigana = Gimei.last.katakana
  post_code = "000-0000"
  address = Gimei.address.kanji
  phone_number = "0000000000"

  Delivery.create!(
  customer_id: customer_id,
  first_name: first_name,
  last_name: last_name,
  first_furigana: first_furigana,
  last_furigana: last_furigana,
  post_code: post_code,
  address: address,
  phone_number: phone_number)
end


## likes
#10.times do |n|
#  customer_id = "#{n+1}"
#  item_id = "#{n+2}"
#
#  Like.create!(
#  customer_id: customer_id,
#  item_id: item_id)
#end