class User < ApplicationRecord
  enum role: %i[user presenter admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one_attached :avatar
  has_many :comments
  has_many :participants
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

  validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=\[\]{};':",.<>?])[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':",.<>?]+\z/,
                                                         message: 'should include at least one number, one uppercase letter, and one special character' }

  validates :avatar, presence: { message: 'is required!' }
end
