Role.create! name: "brand"
Role.create! name: "buyer"

Admin.create(username: "admin", password: "123456",
  password_confirmation: "123456")

(1..2).each do |i|
  if i.odd?

    User.create! username: "hungnv", role_id: 1,
      email: "dongta195@gmail.com"
  else
    User.create! username: "test", role_id: 2,
      email: "bachpx195@gmail.com"
  end
end
