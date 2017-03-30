class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, :text, presence: true,
            length: { minimum: 5 }

  def self.search(search)
    where("title ILIKE ? OR text ILIKE ? ", "%#{search}%", "%#{search}%")
  end

end
