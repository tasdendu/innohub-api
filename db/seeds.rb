# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

desc 'Seeding roles...'
[
  { id: 1, name: 'Admin' }, { id: 2, name: 'User' }
].each do |r|
  Role.find_or_create_by(r)
end

desc 'Seeding users'
[
  { id: 1, email: 'td@dcpl.bt', password: 'Dcpl@123', role_ids: [1], active: true },
  { id: 2, email: 'td+1@dcpl.bt', password: 'Dcpl@123', role_ids: [2], active: true }
].each do |attr|
  user = User.new(attr)
  next if user.persisted?

  user.skip_confirmation!
  user.save
  user.confirm
end

Rails.logger.debug 'Seeding category'
[
  { name: 'Environmental', id: 1 },
  { name: 'Health', id: 2 },
  { name: 'Education', id: 3 },
  { name: 'Agriculture', id: 4 },
  { name: 'Sports', id: 5 },
  { name: 'Religion', id: 6 },
  { name: 'Lifestyle', id: 7 },
  { name: 'Media', id: 8 },
  { name: 'Event', id: 9 },
  { name: 'Politics', id: 10 },
  { name: 'Business', id: 11 },
  { name: 'Startups', id: 12 },
  { name: 'Entertainment', id: 13 },
  { name: 'Court/Legal System', id: 14 },
  { name: 'Immigration', id: 15 },
  { name: 'Race/Gender', id: 16 },
  { name: 'Financial', id: 17 },
  { name: 'Technology', id: 18 }
].each do |c|
  Category.find_or_create_by(c)
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
