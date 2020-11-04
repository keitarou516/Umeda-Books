class BooksController < ApplicationController
    def index
        @books = Book.includes(:rental)
    end

    def new
        if params[:authentication_id] == "1"
            @book = Book.new
        else
            redirect_to action: :index
        end
    end

    def create
        data = Book.create(book_params)
        unless data.save
            render action: :new
        end
    end

    def show
        @book = Book.find(params[:id])
        if @book.rental 
            @id = @book.rental.id
            @name = @book.rental.name
        end
        @reviews = @book.reviews.limit(3)
        @rate = @book.reviews.map(&:rate)
        if @rate.length > 0
            @avg = @rate.inject(:+) / @rate.length
        end
    end

    private
    def book_params
        params.require(:book).permit(:name, :image, :author)
    end

end