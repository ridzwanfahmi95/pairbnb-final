class Listing < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :bookings
end
