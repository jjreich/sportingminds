class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  # GET /journal_entries
  # GET /journal_entries.json
  def index
    if (current_user.has_role? :admin) 
      @journal_entries = JournalEntry.all.order(:dateTimeOfTraining).reverse
    elsif (current_user.has_role? :athlete)
      @journal_entries = JournalEntry.where(:user_id => current_user.id).order(:dateTimeOfTraining).reverse
    end
  end

  # GET /journal_entries/1
  # GET /journal_entries/1.json
  def show
  end

  # GET /journal_entries/new
  def new
    isCoach = current_user.has_role? :coach
    isManager = current_user.has_role? :manager
    isTeamTraining = params[:team_id].present?

    @sports = Sport.all
    if (current_user.has_role? :admin) 
      @goals = Goal.all
    elsif (current_user.has_role? :athlete)
      @goals = Goal.where(:user_id => current_user.id, :active => true) 
    end

    if (isCoach || isManager) && isTeamTraining
      @goals = Goal.where(:active => true, :team_id => params[:team_id])
    end 

    if params[:goal_id].present?
      @goal = Goal.find(params[:goal_id])
      @sport = @goal.sport
      @journal_entry = JournalEntry.new(:user_id => current_user.id, :goal_ids => [@goal.id], :sport => @goal.sport, :trainingAccomplished => @goal.name, :team_id => params[:team_id])
    else
      @journal_entry = JournalEntry.new(:user_id => current_user.id, :team_id => params[:team_id])
    end

    if isTeamTraining 
      @team = Team.find(params[:team_id])
      @sport = @team.sport
      @journal_entry = JournalEntry.new(:user_id => current_user.id, :team_id => params[:team_id], :sport => @team.sport)
    end
  end

  # GET /journal_entries/1/edit
  def edit
    @sports = Sport.all
    if (current_user.has_role? :admin) 
      @goals = Goal.all
    elsif (current_user.has_role? :athlete)
      @goals = Goal.where("user_id = ?", current_user.id)
    end
  end

  # POST /journal_entries
  # POST /journal_entries.json
  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if (current_user.has_role? :admin) 
      @journal_entries = JournalEntry.all.order(:dateTimeOfTraining).reverse
    elsif (current_user.has_role? :athlete)
      @journal_entries = JournalEntry.where(:user_id => current_user.id).order(:dateTimeOfTraining).reverse
    end

    respond_to do |format|
      if @journal_entry.save
        format.js 
        format.html { redirect_to @journal_entry, notice: 'Journal entry was successfully created.' }
        format.json { render :show, status: :created, location: @journal_entry }
      else
        format.html { render :new }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_entries/1
  # PATCH/PUT /journal_entries/1.json
  def update
    if (current_user.has_role? :admin) 
      @journal_entries = JournalEntry.all.order(:dateTimeOfTraining).reverse
    elsif (current_user.has_role? :athlete)
      @journal_entries = JournalEntry.where(:user_id => current_user.id).order(:dateTimeOfTraining).reverse
    end

    respond_to do |format|
      if @journal_entry.update(journal_entry_params)
        format.html { redirect_to @journal_entry, notice: 'Journal entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal_entry }
      else
        format.html { render :edit }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_entries/1
  # DELETE /journal_entries/1.json
  def destroy
    @journal_entry.destroy

    if (current_user.has_role? :admin) 
      @journal_entries = JournalEntry.all.order(:dateTimeOfTraining).reverse
    elsif (current_user.has_role? :athlete)
      @journal_entries = JournalEntry.where(:user_id => current_user.id).order(:dateTimeOfTraining).reverse
    end

    respond_to do |format|
      format.js
      format.html { redirect_to journal_entries_url, notice: 'Journal entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_entry_params
      params.require(:journal_entry).permit(:sport, :dateTimeOfTraining, :duration, :organizedPractice, :trainingAccomplished, :motivationLevel, :performanceLevel, :user_id, :team_id, :goal_ids => [])
    end
end
