User.destroy_all

users = [
  [ "Tom", 'thomasevanneal@gmail.com' ],
  [ "Joe", 'joe.neal@gmail.com' ],
  [ "Amanda", 'amanda.perry87@gmail.com' ]
]

users.each do |name, email|
  User.create( name: name, email: email )
end
