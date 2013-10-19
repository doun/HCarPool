class ResourceSchedule < ActiveRecord::Base
  attr_accessible :available, :destination, :isconfirmed, :ishireconfirmed, :isowner, 
  :isreadytohire, :routeno, :startplace, :starttime, :userId, :userResourceId, :acNonac
  belongs_to :user, :foreign_key => "userId"
  accepts_nested_attributes_for :user


  def self.search start, dest, ispas
  	if ispas == "1"
  		results = ResourceSchedule.where(startplace: start ).where(destination: dest).where(isowner: false)
  	else
  		results = ResourceSchedule.where(startplace: start ).where(destination: dest).where(isowner: true)
  	end
  	#results = ResourceSchedule.all
    results.joins(:user).includes(:user)
  end

  def self.searchuser iduser, ispas
  	if ispas == "0"
  		results = ResourceSchedule.where(isowner: false).where(userId: iduser)
  	else
  		results = ResourceSchedule.where(isowner: true).where(userId: iduser)
  	end
  end
end
