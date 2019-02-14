class AccountabilityPartnershipsController < ApplicationController
  before_action :set_accountability_partnership, only: [:show, :edit, :update]

  # GET /accountability_partnerships
  # GET /accountability_partnerships.json
  def index
    @accountability_partnerships = AccountabilityPartnership.all
  end

  # GET /accountability_partnerships/1
  # GET /accountability_partnerships/1.json
  def show
  end

  # GET /accountability_partnerships/new
  def new
    @accountability_partnership = AccountabilityPartnership.new
  end

  # GET /accountability_partnerships/1/edit
  def edit
  end

  # POST /accountability_partnerships
  # POST /accountability_partnerships.json
  def create
    @accountability_partnership = current_user.accountability_partnerships.build(:accountability_partner_id => params[:accountability_partner_id])

    respond_to do |format|
      if @accountability_partnership.save
        format.html { redirect_to @accountability_partnership, notice: 'Accountability partnership was successfully created.' }
        format.json { render :show, status: :created, location: @accountability_partnership }
      else
        format.html { render :new }
        format.json { render json: @accountability_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountability_partnerships/1
  # PATCH/PUT /accountability_partnerships/1.json
  def update
    respond_to do |format|
      if @accountability_partnership.update(accountability_partnership_params)
        format.html { redirect_to @accountability_partnership, notice: 'Accountability partnership was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountability_partnership }
      else
        format.html { render :edit }
        format.json { render json: @accountability_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountability_partnerships/1
  # DELETE /accountability_partnerships/1.json
  def destroy
    @accountability_partnership = current_user.accountability_partnerships.find(params[:id])
    @accountability_partnership.destroy
    respond_to do |format|
      format.html { redirect_to accountability_partnerships_url, notice: 'Accountability partnership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountability_partnership
      @accountability_partnership = AccountabilityPartnership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountability_partnership_params
      params.require(:accountability_partnership).permit(:user_id, :accountability_partner_id)
    end
end
