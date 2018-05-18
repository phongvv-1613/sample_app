User.create!(name:  "Vu Phong",
             email: "vuphong95663@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
