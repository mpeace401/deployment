class AdminController < ApplicationController
  def index
  end
  
  def users
    @users = User.all 
  end

  def transactions
    @transactions = Transaction.all
  end
end
