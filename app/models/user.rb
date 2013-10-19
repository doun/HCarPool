class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :lockable, :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password,:remember_me
  attr_accessible :provider, :uid, :name, :role_ids, :mobile, :image_url
  attr_accessible :preference_attributes
  has_one :preference
  has_many :user_resource 
  has_many :venues
  has_many :reviews
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :preference, :user_resource

  validates :name, :presence => true

 	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
 		
		user = User.where(:email => access_token.info.email).first
		
	  	unless user
	    	user = User.create(name:access_token.extra.raw_info.name,
	                         provider:access_token.provider,
	                         uid:access_token.uid,
	                         email:access_token.info.email,
	                         image_url:'http://graph.facebook.com/'+access_token.uid+'/picture?width=35&height=35',
	                         password:Devise.friendly_token[0,20]
	                         )

	    	
	  	end
  		user
	end
end
