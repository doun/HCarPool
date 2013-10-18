class User < ActiveRecord::Base
  attr_accessible :confirmation_sent_at, :confirmation_token, :confirmed_at, :email, :password, :unconfirmed_email
end
