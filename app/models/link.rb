class Link < ActiveRecord::Base

  enum kind: %i(video photo)

  belongs_to :trip

  validates :title, presence: true
  validates :url,   presence: true

  scope :photos, -> { where(kind: kinds[:photo]) }
  scope :videos, -> { where(kind: kinds[:video]) }

end
