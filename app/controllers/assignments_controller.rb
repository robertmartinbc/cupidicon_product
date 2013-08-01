class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
  end

  def edit
  end
end
