class Admin::ActivitiesController < AdminController
  before_action :find_activity, only: [:edit, :update, :destroy]

  def index
    @activities = Activity.order(id: :desc)
  end

  def new
    @activity = Activity.new
  end

  def create

    @activity = Activity.new(activity_params)

    if @activity.save
      flash[:notice] = "Success to create new activity"
      redirect_to admin_activities_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @activity.update(activity_params)
      flash[:notice] = "Success to update activity"
      redirect_to admin_activities_path
    else
      render :edit
    end
  end

  def destroy
    if @activity.destroy
      flash[:notice] = "Success to delete activity"
      redirect_to admin_activities_path
    else
      flash[:error] = "Fail to delete activity"
      redirect_to :back
    end

  end



  private

  def find_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :registration_link, :more_information_link, :image)
  end

end