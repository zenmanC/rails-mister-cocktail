class Ingredient < ApplicationRecord
  has_many :doses
  # before_destroy :check_for_doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true

# private

#   def check_for_doses
#     if doses.count > 0
#       errors.add_to_base("cannot delete ingredient while doses exist")
#       return false
#     end
#   end

end
