class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
