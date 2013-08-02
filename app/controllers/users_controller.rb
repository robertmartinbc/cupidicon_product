class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @assignments = @user.assignments(current_user)  
  end

end
