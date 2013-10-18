class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homes }
    end
  end
  # GET /homes/start
  # GET /homes/start.json
  def start
    @homes = Home.all

    respond_to do |format|
      format.html # start.html.erb
      format.json { render json: @homes }
    end
  end

  def register
    @user = current_user
    @user.build_preference

    respond_to do |format|
      format.html # start.html.erb
      format.json { render json: @user }
    end
  end

    def addResource
    @user = current_user
    @user.build_user_resource
    respond_to do |format|
      format.js # start.html.erb
    end
  end

  def updateuser
    @user = current_user
    @user.save
    
        
    respond_to do |format|
      if @user.save
        format.html { redirect_to register_homes_path, notice: 'Successfully registered.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
