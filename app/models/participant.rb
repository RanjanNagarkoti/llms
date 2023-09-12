class Participant < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event

  # Validations
  validates :user_id, uniqueness: { scope: :event_id, message: 'has already participated in this event.' }
end
