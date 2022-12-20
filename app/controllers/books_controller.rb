class BooksController < ApplicationController
    
    def new
        @book = Book.new
    end
    
    def index
    end
    
    def create
        @book = Book.new(@book_params)
        @book.save
        redirect_to '/books'
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
