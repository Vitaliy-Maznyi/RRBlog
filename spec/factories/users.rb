FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |i| "Johny#{i}" }
    sequence(:last_name) { |i| "Black#{i}" }
    sequence(:email) { |i| "email#{i}@email.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end
end
