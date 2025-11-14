class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # This method tells friendly_id when to regenerate the slug
  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  include PgSearch::Model

  belongs_to :user
  has_one_attached :featured_image
  has_rich_text :content
  has_many :comments, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 200}
  validates :user, presence: true
  validates :featured_image, content_type: ['image/png', 'image/jpeg', 'image/gif'],
                           size: { less_than: 5.megabytes, message: 'must be less than 5MB' },
                           allow_nil: true

  # Scopes
  scope :recent, -> { order(published_at: :desc, created_at: :desc) }
  scope :published , ->{ where.not(published_at: nil).where('published_at <= ?', Time.current)}

  # PgSearch configuration for search functionality
  pg_search_scope :search_by_title_and_content,
                  against: [:title],
                  associated_against: {
                    rich_text_content: [:body]
                  },
                  using: {
                    tsearch: {
                      prefix: true,
                      any_word: true
                    }
                  }

  # Get excerpt from content
  def excerpt(length = 200)
    if content.present? && content.body.present?
      # Strip HTML tags and get plain text
      plain_text = content.body.to_plain_text
      if plain_text.length > length
        plain_text[0..length] + '...'
      else
        plain_text
      end
    else
      ''
    end
  end

  # Check if post is published
  def published?
    published_at.present? && published_at <= Time.current
  end

  # Auto-set published_at on create if not set
  before_create :set_published_at

  private

  def set_published_at
    self.published_at ||= Time.current
  end
end
