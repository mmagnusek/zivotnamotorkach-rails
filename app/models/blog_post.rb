class BlogPost < ActiveRecord::Base
  paginates_per 20

  belongs_to :trip

  scope :newest_first, -> { order("created_at DESC") }

  validates :title, presence: true
  validates :slug,  presence: true
  validates :body,  presence: true

  def to_param
    slug
  end
end
