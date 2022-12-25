class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
    
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
        @book = Book.new
        @books = @user.books
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "You have updated user successfully."
            redirect_to user_path(@user.id)
        else
            render:edit
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end
    
    def correct_user
        @user = User.find(params[:id])
        redirect_to(user_path) unless @user == current_user
    end
end
