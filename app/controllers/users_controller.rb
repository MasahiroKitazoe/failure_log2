class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @failures = @user.failures
  end
end
