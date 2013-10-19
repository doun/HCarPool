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
    @preference = Preference.new

    respond_to do |format|
      format.html # start.html.erb
      format.json { render json: @user }
    end
  end

    def addResource
    @user = User.find(params[:home_id])
     @user.build_user_resource
    respond_to do |format|
      format.js # start.html.erb
    end
  end

  def updateuser
    @preference = Preference.new(params[:preference])

    
    
    respond_to do |format|
      @preference.save
        format.html { redirect_to home_register_path, notice: 'Successfully registered.' }
        format.json { render json: @user, status: :created, location: @user }
      end
  end
end
