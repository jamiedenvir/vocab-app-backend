class UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if current_user.id == user.id
      if params[:password] && params[:password_confirmation]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
      end
      user.name = params[:name] || user.name
      user.email = params[:email] || user.email
      if user.save
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end  
    end
  end

  def destroy
    user = User.find(params[:id])
   
    user.destroy
    render json: {message: "User successfully destroyed"}
    # end
  end

end
