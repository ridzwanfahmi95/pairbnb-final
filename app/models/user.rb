class User < ActiveRecord::Base
  include Clearance::User
  
  # attr_accessible :image
  has_many :authentications, :dependent => :destroy
  has_many :listings
  mount_uploader :image, ImageUploader
#   has_many :bookings

  def self.create_with_auth_and_hash(authentication,auth_hash)
    #warn
    user = User.create!(name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"])
    user.authentications << (authentication)
    return user
#     create! do |u|
#       u.username = auth_hash["info"]["name"]
#       u.name = auth_hash["info"]["name"]
#       u.email = auth_hash["extra"]["raw_info"]["email"]
#       u.authentications<<(authentication)
#     end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

#warn
  def password_optional?
    true
  end
  
end
