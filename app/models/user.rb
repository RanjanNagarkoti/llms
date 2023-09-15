class User < ApplicationRecord
  after_create :send_welcome_email

  enum role: %i[user presenter admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :events, through: :participants

  # Validations
  validates_associated :avatar

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username,
            uniqueness: {
              message: lambda do |_object, data|
                "#{data[:value]} is already taken."
              end
            }

  validates :password, format: {
    with: /\A(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=\[\]{};':",.<>?]).{8,}\z/,
    message: 'should include at least one number, one uppercase letter, and one special character, and be at least 8 characters long'
  }

  private

  def send_welcome_email
    UserMailer.welcome_message(email).deliver_later
  end
end
