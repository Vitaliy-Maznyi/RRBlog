FactoryGirl.define do
  factory :post do
    user
    sequence(:title) { |i| "Awesome title for #{i} post" }
    sequence(:text) { |i| "Awesome text of #{i} post" }
  end
end
