class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]

    def new
        @book = Book.new
    end

    def create
        @user = current_user
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book), notice: 'You have created book successfully.'
        else
            render 'index'
        end
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
    end

    def show
        @user = current_user
        @book = Book.new
        @showBook = Book.find(params[:id])
    end

    def edit
        @user = current_user
        @book = Book.new
        @myBook = Book.find(params[:id])
    end

    def update
        @user = current_user
        @book = Book.new
        @myBook = Book.find(params[:id])
        if @myBook.update(book_params)
            redirect_to book_path(@myBook), notice: 'You have updated book successfully.'
        else
            render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path()
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

    def ensure_correct_user
        @book = Book.find(params[:id])
        if @book.user.id != current_user.id
            redirect_to books_path
        end
    end
end
