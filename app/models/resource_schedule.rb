class ResourceSchedule < ActiveRecord::Base
  attr_accessible :available, :destination, :isconfirmed, :ishireconfirmed, :isowner, :isreadytohire, :routeno, :startplace, :starttime, :userId, :userResourceId, :acNonac
end
