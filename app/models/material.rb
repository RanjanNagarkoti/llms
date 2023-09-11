class Material < ApplicationRecord
  # Associations
  belongs_to :event
  has_many_attached :files
end
