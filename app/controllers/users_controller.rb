class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(params[:user].permit(:name, :email))

    # user.save!
    # render json: user

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    render json: params
  end
end
