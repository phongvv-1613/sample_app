class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :find_user, except: [:index, :new]

  def index
    @users = User.load_data.page(params[:page]).per Settings.user.per_page
  end

  def new
    @user = User.new
  end

  def show
    @microposts = @user.microposts.order_by_created_at
                                  .page(params[:page])
                                  .per Settings.user.per_page
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".danger"
    end
    redirect_to users_url
  end

  def following
    @title = t ".title"
    @users = @user.following.page params[:page]
    render :show_follow
  end

  def followers
    @title = t ".title"
    @users = @user.followers.page params[:page]
    render :show_follow
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash.now[:danger] = t ".danger"
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".danger"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
