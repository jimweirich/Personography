class UsersController < ApplicationController
  assume(:user) { User.find(params[:id]) }

  def new
    self.user = User.new
  end

  def create
    self.user = User.new(params[:user])
    if user.save
      redirect_to root_path, notice: "Thank you for signing up"
    else
      render :new
    end
  end

  def show
    # default
  end

  def edit
    # default
  end

  def update
    if user.update_attributes(params[:user])
      redirect_to user, notice: "Account Updated"
    else
      render :edit
    end
  end

  def destroy
    if user.destroy
      redirect_to root_path, notice: "User #{user.name} deleted."
    else
      redirect_to root_path, alert: "Unable to delete user #{user.name}"
    end
  end
end
