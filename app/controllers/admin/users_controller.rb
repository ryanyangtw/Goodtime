class Admin::UsersController < AdminController
  
  def index
    @users = User.order(id: :desc).paginate(:page => params[:page], :per_page=>50)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Success to delete user"
      redirect_to :back
    else
      flash[:alert] = "Something Wrong"
    end
  end

  def change_role
    @user = User.find(params[:id])
    @user.change_role
    flash[:notice] = "Sucess to change role"
    redirect_to admin_users_path
  end

  def search
    @q = User.ransack(params[:q]) 
    @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30 )
    render :index
  end

end