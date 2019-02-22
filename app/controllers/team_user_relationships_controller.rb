class TeamUserRelationshipsController < ApplicationController
  before_action :set_team_user_relationship, only: [:show, :edit, :update, :destroy]

  # GET /team_user_relationships
  # GET /team_user_relationships.json
  def index
    @team_user_relationships = TeamUserRelationship.all
  end

  # GET /team_user_relationships/1
  # GET /team_user_relationships/1.json
  def show
  end

  # GET /team_user_relationships/new
  def new
    @team_user_relationship = TeamUserRelationship.new
  end

  # GET /team_user_relationships/1/edit
  def edit
  end

  # POST /team_user_relationships
  # POST /team_user_relationships.json
  def create
    @team_user_relationship = TeamUserRelationship.new(:user_id => params[:user_id], :team_id => params[:team_id])

    respond_to do |format|
      if @team_user_relationship.save
        @user = current_user

        format.js
        format.html { redirect_to @team_user_relationship, notice: 'Team user relationship was successfully created.' }
        format.json { render :show, status: :created, location: @team_user_relationship }
      else
        format.html { render :new }
        format.json { render json: @team_user_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_user_relationships/1
  # PATCH/PUT /team_user_relationships/1.json
  def update
    respond_to do |format|
      if @team_user_relationship.update(team_user_relationship_params)
        format.html { redirect_to @team_user_relationship, notice: 'Team user relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_user_relationship }
      else
        format.html { render :edit }
        format.json { render json: @team_user_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_user_relationships/1
  # DELETE /team_user_relationships/1.json
  def destroy
    @team_user_relationship.destroy
    respond_to do |format|
      @user = current_user

      format.js
      format.html { redirect_to team_user_relationships_url, notice: 'Team user relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_user_relationship
      @team_user_relationship = TeamUserRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_user_relationship_params
      params.require(:team_user_relationship).permit(:team_id, :user_id)
    end
end
