class BlogPost < ActiveRecord::Base
  paginates_per 20

  belongs_to :trip

  scope :newest_first, -> { order("created_at DESC") }

  validates :title, presence: true
  validates :slug,  presence: true
  validates :body,  presence: true

  def self.create_or_update_from_blogger(attributes)
    blog_post = find_by(blogger_id: attributes['id'])
    if blog_post
      if blog_post.etag != attributes['etag']
        blog_post.update_attributes(
          title: attributes['title'],
          body:  attributes['content'],
          etag:  attributes['etag']
        )
      end
    else
      BlogPost.create do |blog_post|
        if labels = attributes['labels']
          trip = Trip.find_by(label: labels[0])
        end
        published_at = Time.parse(attributes['published'])
        blog_post.trip       = trip
        blog_post.blogger_id = attributes['id']
        blog_post.title      = attributes['title']
        blog_post.body       = attributes['content']
        blog_post.etag       = attributes['etag']
        blog_post.slug       = "#{published_at.to_date.to_s}-#{attributes['title'].parameterize}"
        blog_post.created_at = published_at
      end
    end
  end

  def to_param
    slug
  end
end
