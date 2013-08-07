class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @published_assignments = Assignment.published.where(user_id: @user.id)     
  end

end
