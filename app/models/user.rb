class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimun: 2, maximum: 50 }
   
  # Return display name (use name if present, otherwise email)
  def display_name
    name.presence || email.split('@').first
  end
end
