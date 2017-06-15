class Postcard < ActiveRecord::Base
  validates :name, :city, :zip_code, :street, presence: true

  scope :ordered, -> { order('sent_at desc nulls first, created_at asc') }
end
