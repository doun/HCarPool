class ResourceSchedule < ActiveRecord::Base
  attr_accessible :available, :destination, :isconfirmed, :ishireconfirmed, :isowner, 
  :isreadytohire, :routeno, :startplace, :starttime, :userId, :userResourceId, :acNonac


  def self.search start, dest
  	results = ResourceSchedule.where(startplace: start ).where(destination: dest)
  	#results = ResourceSchedule.all
  end

end
