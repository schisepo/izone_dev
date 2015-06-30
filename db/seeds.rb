# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  name = Faker::Company.name
  email= "company-#{n+1}@railstutorial.org"
  bpn=Faker::Company.ein
  Organisation.create!(name:name,
                      email:email,
                      bpn:bpn)
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             organisation_id: 1)
Task.create!(content: "Example Content",
            user_id: 1,
            organisation_id: 1,
            status: "false")

organisations = Organisation.order(:created_at).take(50) 
  password = "password"
  organisations.each { |organisation| 1.times do |n| 
               organisation.users.create!(name:  Faker::Name.name,
               jobtitle:Faker::Name.title,
               bio:Faker::Lorem.paragraphs(1),
               email: "example-#{organisation.id+1}@railstutorial.org",
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now) end }

organisations = Organisation.order(:created_at).take(10) 
  password = "password"
  organisations.each { |organisation| 1.times do |n| 
            name  = Faker::Name.name
            title = Faker::Name.title
            bio   = Faker::Lorem.paragraphs(1)
            organisation.users.create!(name:  Faker::Name.name,
               jobtitle:Faker::Name.title,
               bio:Faker::Lorem.paragraphs(1),
               email: "example2-#{organisation.id+1}@railstutorial.org",
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now) end }

users =User.order(:created_at).take(50)
 users.each { |user| 1.times do |n| 
            content  = Faker::Lorem.paragraphs(1)
            status   = "false"
            user.tasks.create!(content:  Faker::Lorem.paragraphs(1),
               status: "false",
               organisation_id: user.organisation_id) end }


