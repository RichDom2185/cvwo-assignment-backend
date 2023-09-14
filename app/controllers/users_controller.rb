class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotUnique => e
    if e.message.include? 'index_users_on_email'
      render json: { error: "Email already exists" }, status: :unprocessable_entity
    else
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
