class Trip < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :blog_posts
  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  validates :title,     presence: true
  validates :begin_on,  presence: true
  validates :homepage_body, presence: true, if: :display_on_homepage?

  scope :ordered, -> { order(:begin_on) }

  def to_s
    title
  end
end
