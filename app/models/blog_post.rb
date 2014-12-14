class BlogPost < ActiveRecord::Base
  paginates_per 20

  belongs_to :trip

  default_scope -> { order("created_at DESC") }

  validates :title, presence: true
  validates :slug,  presence: true
  validates :body,  presence: true

end
