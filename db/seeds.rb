# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# coding: utf-8

# Customer
Customer.create!(
  first_name: "円盤",
  last_name: "長野",
  first_furigana: "enban",
  last_furigana: "nagano",
  post_code: "000-0000",
  address: "長野県長野市四丁目",
  phone_number: "000-0000-000",
  email: "nagano@gmail.com",
  password: "password" )

10.times do |n|
  first_name = Gimei.first.kanji
  last_name = Gimei.last.kanji
  first_furigana = Gimei.first.katakana
  last_furigana = Gimei.last.katakana
  post_code = "000-0000",
  address = Gimei.address.kanji
  phone_number = "000-0000-000",
  email = "nagano#{n+1}@gmail.com",
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
  jacket_image = "#{n+1}"
  genre_id = "#{n+1}"
  label_id = "#{n+1}"
  quantity = "#{n+1}"
  release_date = "2019/11/1"
  is_selling = "True"
  prices  = "#{n+1}"

  Item.create!(
  name: name,
  format: format,
  artist_id: artist_id,
  jacket_image: jacket_image,
  genre_id: genre_id,
  label_id: label_id,
  quantity: quantity,
  release_date: release_date,
  is_selling: is_selling,
  prices: prices)
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

Artist.create!(
   name: 'AKB',
)
