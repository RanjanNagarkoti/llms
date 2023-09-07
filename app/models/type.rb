class Type < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
end
