class UsersController < ApplicationController
  before_action :set_user 
  before_action :authenticate_user!, except: %i[show]

  # GET /@username
  def show 
    @user = User.find_by(username: params[:username])
  end

  # POST /@username/follow
  def follow
    @follow = current_user.add_follow(@user)

    if @follow.errors.nil?
      redirect_to user_path(@user), 
                  notice: "You've followed #{@user}."
    else 
      redirect_to user_path(@user), 
                  alert: @follow.errors.full_messages.join
    end
  end

  # DELETE /@username/unfollow
  def unfollow
    @unfollow = current_user.remove_follow(@user)
    redirect_to @user, notice: "You've unfollowed #{@user}"
  end

  private 
    def set_user 
      @user = User.find_by(username: params[:username])
    end
end
