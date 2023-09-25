class AdminController < ApplicationController
  def index
  end
  
  def users
    @users = User.all  
  end
end
