class SessionsController < ApplicationController
  def new
    # goes to login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user != nil #can also use .present?
      # 3. if they know their password -> login is successful
        if BCrypt::Password.new(@user["password"]) == params["password"]

          # ---------- begin user session 
          # cookies follow that user from page to page within the website 
          
          session["user_id"] = @user["id"]
          session["username"] = @user["username"]
          
          flash["notice"] = "Welcome."
          redirect_to "/places"
        else
          flash["notice"] = "Wrong password"
          redirect_to "/login"
        end
          
      # 4. if the user doesn't exist or they don't know their password -> login fails
    else
      flash["notice"] = "User does not exist"
      redirect_to "/login"
    end
  end

  def destroy
    # logout the user
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  