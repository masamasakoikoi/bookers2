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
        @books = current_user.books
        @user = @book.user
        if @book.save
            flash[:notice] = "You have created book successfully."
            redirect_to book_path(@book.id)
        else
            render:index
        end
    end
    
    def show
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(@book.id)
        else
            render:edit
        end
    end
    
    def destroy
       book = Book.find(params[:id])
       book.destroy
       redirect_to books_path
    end
    
    
    
private
    def book_params
        params.require(:book).permit(:title,:body)
    end
end
