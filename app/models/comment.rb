class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations
  validates :body, presence: true, length: { minimun: 2, maximum: 1000}
  validates :user, presence: true
  validates :post, presence: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }

  # Method to check if comment belongs to a specific user
  def owned_by(user)
    self.user == user
  end
end
