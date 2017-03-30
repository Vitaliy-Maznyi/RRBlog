class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: {in: 2..150,
                            too_short: 'Must be at least 2 characters',
                            too_long: 'Must be less than 150 characters'},
                    presence: true
end
