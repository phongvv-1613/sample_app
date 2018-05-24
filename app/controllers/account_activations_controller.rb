class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
      flash[:success] = t".success"
      redirect_to user
    else
      flash[:danger] = t".danger"
=======
      flash[:success] = t ".success"
      redirect_to user
    else
      flash[:danger] = t ".danger"
>>>>>>> Chapter 12
      redirect_to root_url
    end
  end
end
