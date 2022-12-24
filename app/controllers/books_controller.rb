class BooksController < ApplicationController
    
    def new
        @book = Book.new
    end
    
    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
    end
    
    def show
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    def edit
    end
    
    def update
    end
    
    
    
private
    def book_params
        params.require(:book).permit(:title,:body)
    end
end
