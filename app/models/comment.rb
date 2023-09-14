class Comment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  # Validations
  validates :user, presence: true
  validates :content, presence: true, length: { minimum: 1 }
  validates :event, presence: true

  broadcasts_to ->(comment) { [comment.event, 'comments'] }, inserts_by: :prepend
end
