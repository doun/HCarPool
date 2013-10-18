class FindcarController < ApplicationController
	def new
		@resource_schedule = ResourceSchedule.new
		render 'index'
	end
end
