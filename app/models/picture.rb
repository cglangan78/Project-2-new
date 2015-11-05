class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "600x600" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :image

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
