class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        users = User.all
        render json: users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update!(user_params)

        if user.save
            render json: user  
        else
            render json: {error: user.errors.full_messages}, status: :not_acceptable
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :password, :firstname, :lastname, :city, :state, :bio, :pic, :avatar)
    end
end