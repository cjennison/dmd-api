class UsersController < ApplicationController

  api :PUT, '/users/:id'
  param :id, :number
  description "Update user with id"
  def update
    user = User.find(params[:id])
    user.update!(user_params)
    json_response(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
