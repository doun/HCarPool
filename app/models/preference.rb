class Preference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :acNonac, :carModel, :copassangerGender, :from, :maxCapacity, :startTime, :to
end
