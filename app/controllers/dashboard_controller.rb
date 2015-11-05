class DashboardController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
  end

  def search
    @users = User.search_by_username(params[:search_username]).paginate(:page => params[:page])
  end
end
