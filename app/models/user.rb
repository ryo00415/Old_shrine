class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goods
  has_many :good_photos, through: :goods, source: :photo
  has_many :comments
  has_many :photos
  attribute :deleted, :boolean, default: false
  def goods?(photo)
    goods.exists?(photo_id: photo.id)
  end
end
