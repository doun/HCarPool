class Preference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :acNonac, :carModel, :copassangerGender, :from, :maxCapacity, :startTime, :to

  validates :acNonac, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :startTime, presence: true

  validates_inclusion_of :copassangerGender, :in => ['Male', 'Female', 'Any']

  def copassangerGender
    read_attribute(:copassangerGender)
  end
  def copassangerGender= (value)
    write_attribute(:copassangerGender, value)
  end


  validates_inclusion_of :carModel, :in => ['Indiga', 'Innova', 'Any']

  def carModel
    read_attribute(:carModel)
  end
  def carModel= (value)
    write_attribute(:carModel, value)
  end

end
