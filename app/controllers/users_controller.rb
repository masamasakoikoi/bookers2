class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        user.save
        flash[:notice] = "Welcome! You have signed up successfully."
        redirect_to user_path(user.id)
    end
    
    def index
       @users = User.all
       @user = current_user
    end
    
    def show
        @user = User.find(params[:id])
        @books = @user.books
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(user.id)
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:name,:image,:introduction)
    end
end
