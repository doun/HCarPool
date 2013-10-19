class ResourceSchedulesController < ApplicationController
  # GET /resource_schedules
  # GET /resource_schedules.json
  def index
    @resource_schedules = ResourceSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_schedules }
    end
  end

  def find
    @resource_schedule = ResourceSchedule.new

    #@query = SearchParam.new
    #@query.start = params[:start] unless params[:start].nil?
    #@query.dest = params[:start] unless params[:start].nil?

    @results = ResourceSchedule.search params[:start], params[:dest], params[:ispas]
    
    respond_to do |format|
      format.js
    end
  end

  # GET /resource_schedules/1
  # GET /resource_schedules/1.json
  def show
    @resource_schedule = ResourceSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_schedule }
    end
  end

  # GET /resource_schedules/new
  # GET /resource_schedules/new.json
  def new
    @resource_schedule = ResourceSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_schedule }
    end
  end

  # GET /resource_schedules/1/edit
  def edit
    @resource_schedule = ResourceSchedule.find(params[:id])
  end

  # POST /resource_schedules
  # POST /resource_schedules.json
  def create
    @resource_schedule = ResourceSchedule.new(params[:resource_schedule])

    respond_to do |format|
      if @resource_schedule.save
        format.html { redirect_to @resource_schedule, notice: 'Resource schedule was successfully created.' }
        format.json { render json: @resource_schedule, status: :created, location: @resource_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_schedules/1
  # PUT /resource_schedules/1.json
  def update
    @resource_schedule = ResourceSchedule.find(params[:id])

    respond_to do |format|
      if @resource_schedule.update_attributes(params[:resource_schedule])
        format.html { redirect_to @resource_schedule, notice: 'Resource schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_schedules/1
  # DELETE /resource_schedules/1.json
  def destroy
    @resource_schedule = ResourceSchedule.find(params[:id])
    @resource_schedule.destroy

    respond_to do |format|
      format.html { redirect_to resource_schedules_url }
      format.json { head :no_content }
    end
  end

  # POST /resource_schedules
  # POST /resource_schedules.json
  def searchcar
    @resource_schedule = ResourceSchedule.new(params[:resource_schedule])
    logger.info params
    @resource_schedule.userId = current_user.id
    @resource_schedule.startplace = params[:startplace]
    @resource_schedule.destination = params[:destination]
    @resource_schedule.isowner = false
    @resource_schedule.isconfirmed = false
    @resource_schedule.ishireconfirmed = false
    @resource_schedule.starttime = DateTime.parse(params[:resource_schedule_startdate].to_s + " " + params[:resource_schedule_starttime].to_s, "%d/%m/%Y %H-%M")

    # TODO: We should not be saving this. But, we should just show the results, and give the option to save it
    respond_to do |format|
      if @resource_schedule.save
        format.html { redirect_to startsearch_path, notice: 'Resource schedule was successfully created.' }
        format.json { render json: startsearch_path, status: :created, location: @resource_schedule }
      else
        format.html { redirect_to startsearch_path, notice: 'Unable to add it to listing' }
        format.json { render json: @resource_schedule.errors, status: :created, location: @resource_schedule }
      end
    end
  end

  def startsearch
    @resource_schedule = ResourceSchedule.new

    # TODO: Filter my Resource Schedules based on user id and date time
    @myresource_schedules = ResourceSchedule.all
    @searchcriteria = "car"
    @isowner = "1"
    if(params[:q] =="fc") #Find Car
    	@searchcriteria = "car"
     	@isowner = "0"
    elsif (params[:q] =="fp") #Find Passenger
     	@searchcriteria = "pass"
	@isowner = "1"
    elsif(params[:q]=="gh") #Group Hire
	     @searchcriteria = "group"
    else
    end

    @display = "results"
    if(params[:listid].nil?)
        @display = "empty"
    else 
	@schedule = ResourceSchedule.find(params[:listid])
	@results = ResourceSchedule.search @schedule.startplace, @schedule.destination, @isowner
	@defstartplace = @schedule.startplace
	@defdest = @schedule.destination
	@resource_schedule = ResourceSchedule.new
    end
  end
  
   def findcar
	@resource_schedule = ResourceSchedule.new

	# TODO: Filter my Resource Schedules based on user id and date time
	@myresource_schedules = ResourceSchedule.all
	render 'findcar'
   end

  def findpass
  	@resource_schedule = ResourceSchedule.new

  	# TODO: Filter my Resource Schedules based on user id and date time
  	@myresource_schedules = ResourceSchedule.all
  	render 'findpass'
   end

  # POST /resource_schedules
  # POST /resource_schedules.json
  def searchpass
    @resource_schedule = ResourceSchedule.new(params[:resource_schedule])
    @resource_schedule.userId = current_user.id
    @resource_schedule.startplace = params[:startplace]
    @resource_schedule.destination = params[:destination]
    @resource_schedule.acNonac = params[:resource_schedule_isacnonac]
    @resource_schedule.isowner = true
    @resource_schedule.isconfirmed = true
    @resource_schedule.ishireconfirmed = false
    @resource_schedule.starttime = DateTime.parse(params[:resource_schedule_startdate].to_s + " " + params[:resource_schedule_starttime].to_s, "%d/%m/%Y %H-%M")

    # TODO: Save this and search for passengers
    respond_to do |format|
      if @resource_schedule.save
        format.html { redirect_to "/search?q=fp", notice: 'Listing has been successfully added.' }
        format.json { render json: startsearch_path, status: :created, location: @resource_schedule }
      else
        format.html { redirect_to startsearch_path, notice: 'Listing has not been added.'  }
        format.json { render json: @resource_schedule.errors, status: :unprocessable_entity }
      end
    end
  end
end
