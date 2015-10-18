class Admin::UsersController < AdminController
  before_action :set_user, only: [:destroy, :change_role, :edit, :update, :generate_member_id]
  
  def index
    @users = User.order(id: :desc).paginate(:page => params[:page], :per_page=>50)
  end

  def destroy
    # @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Success to delete user"
      redirect_to :back
    else
      flash[:alert] = "Something Wrong"
    end
  end

  def change_role
    # @user = User.find(params[:id])
    @user.change_role
    flash[:notice] = "Sucess to change role"
    redirect_to admin_users_path
  end

  def search
    @q = User.ransack(params[:q]) 
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30 )
    render :index
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    params[:user][:course_ids] ||= []
    @user.course_ids = params[:user][:course_ids]

    flash[:notice] = "Success to update member"
    redirect_to :back
  end

  def generate_member_id
    @user.generate_member_id
    
    if @user.save(validate: false)
      flash[:notice] = "Success re-generate member id"
    else
      flash[:error] = "Sorry, Something wronf"
    end

    redirect_to :back
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

end