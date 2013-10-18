class Preference < ActiveRecord::Base
  belongs_to :user_id
  attr_accessible :acNonac, :carModel, :copassangerGender, :from, :maxCapacity, :startTime, :to
end
