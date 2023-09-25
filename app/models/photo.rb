class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos
  has_many :goods
  has_many :good_users, through: :goods, source: :user
  has_one_attached :image
  validates :image, presence: true
  validates :title, presence: true
  validates :caption, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
