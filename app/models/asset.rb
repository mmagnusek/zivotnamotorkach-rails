class Asset < ActiveRecord::Base
  belongs_to :trip

  has_attached_file :file, styles: {
    micro: '50x50>',
    thumb: '240x240>'
  }

  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
