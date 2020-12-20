class RelationshipsController < ApplicationController
  def follows
    @user = User.find(params[:user_id])
  end

  def followers
    @user = User.find(params[:user_id])
  end

  def create
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end
end
