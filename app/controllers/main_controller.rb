class MainController < ApplicationController
  before_action :authenticate_user! 

  def index
    @reviews = Review.where(user_id: current_user.follow_ids).recent
  end
end
