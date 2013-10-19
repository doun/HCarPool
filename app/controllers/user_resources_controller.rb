class UserResourcesController < ApplicationController
  # GET /user_resources
  # GET /user_resources.json

    before_filter :get_user

  def get_user
    logger.info params
    @user = User.find(params[:user_id])
  end

  # GET /user_resources/1
  # GET /user_resources/1.json
  def show
    @user_resource = UserResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_resource }
    end
  end

  # GET /user_resources/new
  # GET /user_resources/new.json
  def new
    @user_resource = @user.user_resource.new()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_resource }
    end
  end

  # GET /user_resources/1/edit
  def edit
    @user_resource = UserResource.find(params[:id])
  end

  # POST /user_resources
  # POST /user_resources.json
  def create
    @user_resource = @user.user_resource.new(params[:user_resource])

    respond_to do |format|
      if @user_resource.save
        format.html { redirect_to user_preferences_path(@user), notice: 'User resource was successfully created.' }
        format.json { render json: @user_resource, status: :created, location: @user_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @user_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_resources/1
  # PUT /user_resources/1.json
  def update
    @user_resource = UserResource.find(params[:id])

    respond_to do |format|
      if @user_resource.update_attributes(params[:user_resource])
        format.html { redirect_to @user_resource, notice: 'User resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_resources/1
  # DELETE /user_resources/1.json
  def destroy
    @user_resource = UserResource.find(params[:id])
    @user_resource.destroy

    respond_to do |format|
      format.html { redirect_to user_resources_url }
      format.json { head :no_content }
    end
  end
end
