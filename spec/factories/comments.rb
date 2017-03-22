FactoryGirl.define do
  factory :comment do
    user
    post
    sequence(:body) {|i| "Awesome comment number #{i}"}
  end
end