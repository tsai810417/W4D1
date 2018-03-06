class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    # user.save!
    # render json: user
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    id = params[:id]
    render json: User.find(id)
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.update(user_params)
    render json: User.find(id)
  end

  def destroy
    id = params[:id]
    render json: User.destroy(id)
  end

  private

  def user_params
    params[:user].permit(:name, :email)
  end
end
