# coding: utf-8

# Customer
50.times do |n|
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

#コツボ
 Customer.create!(
  first_name: "均",
  last_name: "小坪",
  first_furigana: "ヒトシ",
  last_furigana: "コツボ",
  post_code: "000-0000",
  address: "東京都渋谷区二子玉川",
  phone_number: "00000000000",
  email: "kotsuboon@gmail.com",
  password: "password")

# artist
15.times do |n|
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
50.times do |n|
  name  = Faker::Music.album
  format = [true,false].sample
  artist_id = rand(1..15)
  genre_id = rand(1..10)
  label_id = rand(1..10)
  quantity = rand(1..3)
  release_date = "2019/11/1"
  is_selling = [true,false].sample
  prices  = [500,1000,3000].sample
  tax_id  = 1

  Item.create!(
  name: name,
  format: format,
  artist_id: artist_id,
  genre_id: genre_id,
  label_id: label_id,
  quantity: quantity,
  release_date: release_date,
  is_selling: is_selling,
  prices: prices,
  tax_id: tax_id)
end

#Disk.create!(
#   item_id: '1',
#   disk_number: '5',
#   quantity: '10',
#)

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

## Admin
name = "管理者A"
email = "admin@gmail.com"
password = "password"
Admin.create!(
  name: name,
  email: email,
  password: password)

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

# TaxInPostage
  TaxInPostage.create!(
    price: 500)


# Tax
  Tax.create!(
    rate: 0.1)

# disk
40.times do |n|
  item_id = "#{n+1}"
  disk_number = "1"
  quantity = 15
  Disk.create!(
    item_id: item_id,
    disk_number: disk_number,
    quantity: quantity
  )
end
40.times do |n|
  item_id = "#{n+1}"
  disk_number = "2"
  quantity = 15
  Disk.create!(
    item_id: item_id,
    disk_number: disk_number,
    quantity: quantity
  )
end

# track
15.times do |n|
  track_number = "#{n+1}"
  80.times do |m|
    disk_id = "#{m+1}"
    name = Faker::Book.title
    Track.create!(
      disk_id: disk_id,
      track_number: track_number,
      name: name
    )
  end
end


#arrived_item
20.times do |n|
  item_id = rand(1..40)
  quantity = rand(5..7)
  date = Random.rand(DateTime.now.ago(3.month)..DateTime.now.since(3.month))
ArrivedItem.create!(
  item_id: item_id,
  quantity: quantity,
  date: date
    )
end


#order
30.times do |n|
  customer_id = rand(1..51)
  tax_in_postage_id = 1
  payment_method = rand(0..2)
  post_code = "000-0000"
  address = Gimei.address.kanji
  phone_number = "00000000000"
  tax_in_total_price = [5500,11000,33000].sample
  order_status = rand(0..2)
  name = Gimei.last.kanji + Gimei.first.kanji
  furigana = Gimei.last.katakana + Gimei.first.katakana

Order.create!(
  customer_id: customer_id,
  tax_in_postage_id: tax_in_postage_id,
  payment_method: payment_method,
  post_code: post_code,
  address: address,
  phone_number: phone_number,
  tax_in_total_price: tax_in_total_price,
  order_status: order_status,
  name: name,
  furigana: furigana
  )
end


#order_detail
30.times do |n|
  order_id = "#{n+1}"
    5.times do |m|
      item_id = rand(1..40)
      price = [550,1100,3300].sample
      order_quantity = rand(1..3)
      OrderDetail.create!(
      order_id: order_id,
      item_id: item_id,
      price: price,
      order_quantity: order_quantity
      )
    end
  end

# 10.times do |n|
#   order_id = rand(1..30)
#     5.times do |m|
#       item_id = rand(1..40)
#       price = [550,1100,3300].sample
#       order_quantity = 100
#       OrderDetail.create!(
#       order_id: order_id,
#       item_id: item_id,
#       price: price,
#       order_quantity: order_quantity
#       )
#     end
#   end

