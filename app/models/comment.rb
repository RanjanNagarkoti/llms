class Comment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event

  # Validations
  validates :user, presence: true
  validates :content, presence: true, length: { minimum: 1 }
  validates :event, presence: true
end
