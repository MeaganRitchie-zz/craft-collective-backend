class UsersController < ApplicationController
skip_before_action :authorized, only: [:index, :create, :login]
  
  def profile
    render json: @user, include: :crafts
  end

  def index 
    @user = User.all
    render json: @user
  end

  def create
    @user = User.create(user_params)

    render json: @user, methods: :token, status: :created
  end

  def login
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])

      render json: {user: @user, token: @token}, include: :crafts
    else
      render json: {error: "Invalid Credentials"}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
