class Postcard < ActiveRecord::Base
  validates :name, :city, :zip_code, :street, presence: true
end
