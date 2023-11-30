class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
    @media = Media.all
  end
end
