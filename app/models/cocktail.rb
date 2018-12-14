class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  acts_as_taggable

  include PgSearch
  pg_search_scope :search,
    against: [ :name ],
    associated_against: {
      ingredients: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
