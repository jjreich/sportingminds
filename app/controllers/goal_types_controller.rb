class GoalTypesController < ApplicationController
  before_action :set_goal_type, only: [:show, :edit, :update, :destroy]

  # GET /goal_types
  # GET /goal_types.json
  def index
    @goal_types = GoalType.all
  end

  # GET /goal_types/1
  # GET /goal_types/1.json
  def show
  end

  # GET /goal_types/new
  def new
    @goal_type = GoalType.new
  end

  # GET /goal_types/1/edit
  def edit
  end

  # POST /goal_types
  # POST /goal_types.json
  def create
    @goal_type = GoalType.new(goal_type_params)

    respond_to do |format|
      if @goal_type.save
        format.html { redirect_to @goal_type, notice: 'Goal type was successfully created.' }
        format.json { render :show, status: :created, location: @goal_type }
      else
        format.html { render :new }
        format.json { render json: @goal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_types/1
  # PATCH/PUT /goal_types/1.json
  def update
    respond_to do |format|
      if @goal_type.update(goal_type_params)
        format.html { redirect_to @goal_type, notice: 'Goal type was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_type }
      else
        format.html { render :edit }
        format.json { render json: @goal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_types/1
  # DELETE /goal_types/1.json
  def destroy
    @goal_type.destroy
    respond_to do |format|
      format.html { redirect_to goal_types_url, notice: 'Goal type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_type
      @goal_type = GoalType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_type_params
      params.require(:goal_type).permit(:name)
    end
end
