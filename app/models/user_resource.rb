class UserResource < ActiveRecord::Base
  belongs_to :user
  attr_accessible :acNonac, :carModel, :carNumber, :driverName, :imageUrl, :isOwned, :isSelfDrive, :maxCapacity, :user_id

  validates :carModel, presence: true
  validates :carNumber, presence: true
  validates :maxCapacity, presence: true
  
  validates_inclusion_of :carModel, :in => ['indica', 'Innova', 'Any']

  def carModel
    read_attribute(:carModel)
  end
  def carModel= (value)
    write_attribute(:carModel, value)
  end
end
