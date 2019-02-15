class SupportedUsersController < ApplicationController
  before_action :set_supported_user, only: [:show, :edit, :update, :destroy]

  # GET /supported_users
  # GET /supported_users.json
  def index
    @supported_users = current_user.inverse_accountability_partners
  end

  # GET /supported_users/1
  # GET /supported_users/1.json
  def show
  end

  # GET /supported_users/new
  def new
    @supported_user = SupportedUser.new
  end

  # GET /supported_users/1/edit
  def edit
  end

  # POST /supported_users
  # POST /supported_users.json
  def create
    @supported_user = SupportedUser.new(supported_user_params)

    respond_to do |format|
      if @supported_user.save
        format.html { redirect_to @supported_user, notice: 'Supported user was successfully created.' }
        format.json { render :show, status: :created, location: @supported_user }
      else
        format.html { render :new }
        format.json { render json: @supported_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supported_users/1
  # PATCH/PUT /supported_users/1.json
  def update
    respond_to do |format|
      if @supported_user.update(supported_user_params)
        format.html { redirect_to @supported_user, notice: 'Supported user was successfully updated.' }
        format.json { render :show, status: :ok, location: @supported_user }
      else
        format.html { render :edit }
        format.json { render json: @supported_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supported_users/1
  # DELETE /supported_users/1.json
  def destroy
    @supported_user.destroy
    respond_to do |format|
      format.html { redirect_to supported_users_url, notice: 'Supported user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supported_user
      @supported_user = SupportedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supported_user_params
      params.fetch(:supported_user, {})
    end
end
