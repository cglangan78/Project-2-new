class User < ActiveRecord::Base
  has_many :comments
  has_many :pictures
  has_secure_password
  validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, AvatarUploader
end
