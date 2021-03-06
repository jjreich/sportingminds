class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  

  # GET /goals
  # GET /goals.json
  def index
    if (current_user.has_role? :admin) 
      @personalGoals = Goal.all.order(:goalEndDate)
    elsif (current_user.has_role? :athlete)
      @personalGoals = Goal.where(:user_id => current_user.id, :active => true, :team_id => nil).order(:goalEndDate)
      teams = current_user.teams.ids
      @teamGoals = Goal.where(:active => true).where(team_id: teams).order(:goalEndDate)
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal.comments.each do |comment|
      ViewedComment.create :user_id => current_user.id, :comment_id => comment.id
    end
  end

  # GET /goals/new
  def new
    @goal = Goal.new(:user_id => current_user.id, :parent_id => params[:parent_id], :team_id => params[:team_id])
    @sports = Sport.all
    @trainingTypes = TrainingType.all
    @goalTypes = GoalType.all
    @accountability_partnerships = AccountabilityPartnership.where(:user_id => current_user.id)
    @accountability_partners = User.where(:id => current_user.accountability_partners.ids)
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    if (current_user.has_role? :admin) 
      @personalGoals = Goal.all
    elsif (current_user.has_role? :athlete)
      @personalGoals = Goal.where(:user_id => current_user.id, :active => true, :team_id => nil).order(:goalEndDate)
      @teamGoals = Goal.where(:user_id => current_user.id, :active => true).where.not(:team_id => nil).order(:goalEndDate)
    end

    respond_to do |format|
      if @goal.save
        ActiveTest.perform_async(@goal.id)
        format.js 
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    if (current_user.has_role? :admin) 
      @goals = Goal.all
    elsif (current_user.has_role? :athlete)
      @goals = Goal.where(:user_id => current_user.id, :active => true).order(:goalEndDate)
    end

    respond_to do |format|
      if @goal.update(goal_params)
        ActiveTest.perform_async(@goal.id)
        format.js
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy

    if (current_user.has_role? :admin) 
      @goals = Goal.all
    elsif (current_user.has_role? :athlete)
      @goals = Goal.where(:user_id => current_user.id, :active => true).order(:goalEndDate)
    end

    respond_to do |format|
      format.js
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :sport, :goalType, :goalStartDate, :goalEndDate, :recurringEndDate, :training, :recurring, :goalInterval, :goalNumber, :trainingType, :description, :percentComplete, :trainingTimeInterval, :active, :complete, :parent_id, :user_id, :team_id, :journal_entry_ids => [])
    end
end
