class User < ActiveRecord::Base
  include Clearance::User

  include Clearance::User
  
  has_many :authentications, :dependent => :destroy
#   has_many :listings
#   has_many :bookings

  def self.create_with_auth_and_hash(authentication,auth_hash)
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

  def password_optional?
    true
  end
  
end
