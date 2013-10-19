class PreferencesController < ApplicationController
  # GET /preferences
  # GET /preferences.json

  before_filter :get_user

  def get_user
    logger.info params
    @user = User.find(params[:user_id])
  end


  def index
    @preference = @user.preference

    respond_to do |format|
    if @preference.nil?
      @preference = @user.build_preference()
      format.html { redirect_to new_user_preference_path(@user, @preference), notice: 'Preference was successfully created.' }
    
  else
      format.html { redirect_to edit_user_preference_path(@user, @preference), notice: 'Preference was successfully created.' }
    end
      format.json { render json: @preference }
    end
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
    @preference = @user.preference
    @resources = @user.user_resource

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preference }
    end
  end

  # GET /preferences/new
  # GET /preferences/new.json
  def new
    @preference = @user.build_preference()

    @resources = @user.user_resource

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preference }
    end
  end

  # GET /preferences/1/edit
  def edit
    @preference = @user.preference
  end

  # POST /preferences
  # POST /preferences.json
  def create
    @preference = @user.create_preference(params[:preference])
  logger.info @preference
    respond_to do |format|
      if @preference.save
        format.html { redirect_to user_preferences_path(@user), notice: 'Preference was successfully created.' }
        format.json { render json: @preference, status: :created, location: @preference }
      else
        format.html { render action: "new" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preferences/1
  # PUT /preferences/1.json
  def update
    @preference = Preference.find(params[:id])

    respond_to do |format|
      if @preference.update_attributes(params[:preference])
        format.html { redirect_to user_preferences_path(@user), notice: 'Preference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy

    respond_to do |format|
      format.html { redirect_to preferences_url }
      format.json { head :no_content }
    end
  end

end
