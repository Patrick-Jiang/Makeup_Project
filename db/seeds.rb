# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'faker'
# url = 'http://makeup-api.herokuapp.com/api/v1/products.json'

# uri = URI(url)
# response = Net::HTTP.get(uri)
# makeup_jason = JSON.parse(response)
makeup_jason = JSON.parse(File.read('/mnt/c/Users/patri/Desktop/BIT Term 5/WEBD-2007 Full-Stack Web Development/Project_1/makeup_project/db/test_data.json'))

url = 'https://api.printful.com/countries'

uri = URI(url)
response = Net::HTTP.get(uri)
country_json = JSON.parse(response)

countries = []
country_json['result'].each do |key|
  countries.push(key['name'])
end

brands = []
category = []
tags = []
makeup_jason.each do |key, _value|
  brands.push(name: key['brand'], link: key['website_link'])
  category.push(key['category']) unless category.include?(key['category'])

  key['tag_list'].each do |key|
    tags.push(key) unless tags.include?(key)
  end
end
category = category.reject { |e| e.to_s.empty? }
brands = brands.reject { |e| e.to_s.empty? }
tags = tags.reject { |e| e.to_s.empty? }

ProductTag.destroy_all
Tag.destroy_all
Product.destroy_all
Brand.destroy_all
Category.destroy_all

tags.each do |n|
  Tag.create(name: n)
end

category.each do |n|
  Category.create(name: n)
end

brands.each do |n|
  Brand.create(name: n[:name], websit_link: n[:link])
end

makeup_jason.each do |key|
  name = key['name']

  if key['brand'].nil? || key['brand'].empty?
    brand = Brand.create(name: Faker::Lorem.unique.words(number: 1))
    brand_id = brand.id
  else
    brand_id = Brand.where(name: key['brand']).first.id
  end

  if key['category'].nil? || key['category'].empty?
    category = Category.create(name: Faker::Commerce.department(max: 1))
    category_id = category.id
  else
    category_id = Category.where(name: key['category']).first.id
  end

  description = key['description']
  price = key['price']
  image_link = key['image_link']
  tags = []

  key['tag_list'].each do |key1|
    tags.push(key1)
  end

  unless brand_id.to_s.nil? || category_id.to_s.nil?
    product = Product.create(name: name,
                             description: description,
                             price: price,
                             image_link: image_link,
                             country: countries[rand(0..countries.length - 1)],
                             category_id: category_id,
                             brand_id: brand_id)
  end
  tags.each do |x|
    ProductTag.create(product_id: product.id,
                      tag_id: Tag.where(name: x).first.id)
  end
end
