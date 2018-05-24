User.create!(name:  "Vu Phong",
             email: "vuphong95663@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
               password: password,
=======
               password:              password,
>>>>>>> Chapter 12
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
