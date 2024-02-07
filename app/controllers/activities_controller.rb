class ActivitiesController < ApplicationController

  before_action :set_activity, only: %i[ edit update destroy ]

  # GET /activities or /activities.json
  def index
    @category = Category.find_by(id: params[:category_id])
    @activities = @category.activities
  end

  # GET /activities/new
  def new
    @categories = Category.where(user_id: current_user.id)
    @category = Category.find_by(id: params[:category_id])
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @category = Category.find(params[:category_id])
    @activity = Activity.new(activity_params.merge(author: current_user))

    respond_to do |format|
      if @activity.save
        @activity.categories << @category

        format.html { redirect_to category_activities_url(category_id: @category.id), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy!

    respond_to do |format|
      format.html { redirect_to category_activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :amount, :category_id)
    end
end
