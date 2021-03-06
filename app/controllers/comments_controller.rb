class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    session[:return_to] ||= request.referer

    if params[:goal_id].present?
      @goal = Goal.find(params[:goal_id])
      @comment = Comment.new(:user_id => current_user.id, :goal_id => @goal.id, :parent_id => params[:parent_id])
    elsif params[:journal_entry_id].present?
      @journal_entry = JournalEntry.find(params[:journal_entry_id])
      @comment = Comment.new(:user_id => current_user.id, :journal_entry_id => @journal_entry.id, :parent_id => params[:parent_id])
    else
      @comment = Comment.new(:user_id => current_user.id)
    end

    @pastCommentID = "#" + params[:pastCommentID]
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save

        if @comment.goal_id.present?
          @goal = Goal.find(@comment.goal_id)
          @renderLink = "goals/show"
        end

        if @comment.journal_entry_id.present?
          @journal_entry = JournalEntry.find(@comment.journal_entry_id)
          @renderLink = "journal_entries/show"
        end

        format.js
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :goal_id, :user_id, :journal_entry_id, :parent_id)
    end
end
