class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :lockable, :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password,:remember_me
  attr_accessible :provider, :uid, :name, :role_ids, :mobile

  has_many :venues
  has_many :reviews
  has_and_belongs_to_many :roles
  
  validates :name, :presence => true

 	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
 		logger.info 'entering user auth********'
		user = User.where(:email => access_token.info.email).first
		#logger.info access_token.extra.raw_info.name
	  	unless user
	  		logger.info "Login success*********"
	    	user = User.create(name:access_token.extra.raw_info.name,
	                         provider:access_token.provider,
	                         uid:access_token.uid,
	                         email:access_token.info.email,
	                         password:Devise.friendly_token[0,20]
	                         )
	  	end
  		user
	end
end
