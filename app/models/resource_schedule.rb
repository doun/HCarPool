class ResourceSchedule < ActiveRecord::Base
  attr_accessible :available, :destination, :isconfirmed, :ishireconfirmed, :isowner, 
  :isreadytohire, :routeno, :startplace, :starttime, :userId, :userResourceId, :acNonac


  def self.search start, dest, ispas
  	if ispas == "1"
  		results = ResourceSchedule.where(startplace: start ).where(destination: dest).where(isowner: false)
  	else
  		results = ResourceSchedule.where(startplace: start ).where(destination: dest).where(isowner: true)
  	end
  	#results = ResourceSchedule.all
  end

end
