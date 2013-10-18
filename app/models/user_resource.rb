class UserResource < ActiveRecord::Base
  belongs_to :user
  attr_accessible :acNonac, :carModel, :carNumber, :driverName, :imageUrl, :isOwned, :isSelfDrive, :maxCapacity
end
