user_1 = User.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'user@example.com',
  password: 'passw_1234'
)

5.times { |i| Post.create(title: "Title ##{i}", text: 'This is text!') }
