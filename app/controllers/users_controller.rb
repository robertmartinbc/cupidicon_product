class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  #  @revision_assignments = Assignment.revision.where(user_id: @user.id)
    @published_assignments = Assignment.published.where(user_id: @user.id)
  #  @authorize_assignments = Assignment.authorization.where(user_id: @user.id)     
  end

end
