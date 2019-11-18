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

#Disk.create!(
#   item_id: '1',
#   disk_number: '1',
#   quantity: '10',
#)
#
#Track.create!(
#   disk_id: '1',
#   track_number: '1',
#   name: '夏',
#)

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

# likes
6.times do |n|
  customer_id = "#{n+1}"
  item_id = "3"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end
5.times do |n|
  customer_id = "#{n+1}"
  item_id = "5"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end
4.times do |n|
  customer_id = "#{n+1}"
  item_id = "2"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end
3.times do |n|
  customer_id = "#{n+1}"
  item_id = "9"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end
2.times do |n|
  customer_id = "#{n+1}"
  item_id = "6"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end
1.times do |n|
  customer_id = "#{n+1}"
  item_id = "7"

  Like.create!(
  customer_id: customer_id,
  item_id: item_id)
end

# disk
10.times do |n|
  item_id = "#{n+1}"
  disk_number = "1"
  quantity = 15
  Disk.create!(
    item_id: item_id,
    disk_number: disk_number,
    quantity: quantity
  )
end
Disk.create!(
  item_id: "1",
  disk_number: "2",
  quantity: 5
)

# track
10.times do |n|
  disk_id = "#{n+1}"
  15.times do |m|
    track_number = "#{m+1}"
    name = Faker::Book.title
    Track.create!(
      disk_id: disk_id,
      track_number: track_number,
      name: name
    )
  end
end
5.times do |n|
  disk_id = "11"
  track_number = "#{n+1}"
  name = Faker::Book.title
    Track.create!(
      disk_id: disk_id,
      track_number: track_number,
      name: name
    )
end
