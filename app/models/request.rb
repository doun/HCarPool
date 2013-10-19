class Request < ActiveRecord::Base
  attr_accessible :isConfirmed, :requester, :requestfor, :requesttype
end
