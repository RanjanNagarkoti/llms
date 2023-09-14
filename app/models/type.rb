class Type < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :events, dependent: :destroy
end
