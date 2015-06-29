class Admin::CoursesController < AdminController
  before_action :find_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.order(id: :desc)
  end

  def show
    @course = Course.includes(:registers).find(params[:id])
    @users = @course.registers.order(id: :desc).paginate(:page => params[:page], :per_page=>30)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Success to create new course"
      redirect_to admin_courses_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Success to update category"
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:notice] = "Success to delete course"
      redirect_to admin_courses_path
    else
      flash[:error] = "Fail to delete course"
      redirect_to :back
    end

  end



  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :number_of_year, :number_of_season)
  end

end
