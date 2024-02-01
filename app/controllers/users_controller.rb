class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
    @media = Media.all
  end

  def followers
    @user = User.find_by!(username: params.fetch(:username))
  end

  def leaders
    @user = User.find_by!(username: params.fetch(:username))
  end
end
