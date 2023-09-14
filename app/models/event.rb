class Event < ApplicationRecord
  # Associations
  belongs_to :type
  has_one_attached :cover_picture
  has_rich_text :content
  has_many :comments, dependent: :destroy
  has_many_attached :materials
  has_many :participants, dependent: :destroy
  has_many :attendees, through: :participants, source: :user, dependent: :destroy

  enum status: %i[upcoming finished cancled
                  hold]
  enum visibility: %i[event_public event_presenter event_private]

  # Validation
  validates_associated :cover_picture
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :visibility, presence: true
  validates :location, presence: true, length: { maximum: 255 }
  validates :type, presence: true
  validates :cover_picture, presence: true
end
