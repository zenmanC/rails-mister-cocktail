class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo2, PhotoUploader
end
