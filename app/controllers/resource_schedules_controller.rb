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
end
