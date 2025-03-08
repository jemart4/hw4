class UsersController < ApplicationController
  
  
  def new
    @user = User.find_by({ "id" => params["id"] })
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/login"
  end
end
