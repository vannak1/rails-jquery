class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all.order("created_at DESC")
    @discussion = Discussion.new
    respond_to do |format|
      format.html { render :index}
      format.json { render json: @discussions}
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = current_user.discussions.build
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = current_user.discussions.build(discussion_params)
    if @discussion.save
      render json: @discussion, status: 201
    else
      render :new
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:title, :content)
    end
end
