class ProfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:edit, :update, :destroy]
  

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find_by_url(params[:id])
    if @profile.nil?
      @profile = Profile.find(params[:id])
    end
    rescue
      render file: 'public/404', status: 404
  end

  def show_profile
    @profile = current_user.profile
    render 'show'
  rescue
    render file: 'public/404', status: 404
  end

  # GET /profiles/new
  # def new
    # @profile = Profile.new
  # end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    #@profile[:user_id] = current_user
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      #@profile = Profile.find(params[:id])
      #@profile = Profile.find_or_create_by(user_id: current_user)
      @profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit( :email, :company_name, :phone_number, :user_id, :description, :url, :twitter, :website, :facebook, :owner_name)
    end
end
