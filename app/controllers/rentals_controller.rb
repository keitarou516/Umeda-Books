class RentalsController < ApplicationController

    def new
        get_rental_and_book
        if @book.rental
            @id = @book.rental.id
            @name = @book.rental.name
        end
        @rate = @book.reviews.map(&:rate)
        if @rate.length > 0
            @avg = @rate.inject(:+) / @rate.length
        end
    end

    def create
        get_rental_and_book
        data = Rental.new(rental_params)
        unless data.save
            render action: :new
        end
    end

    def destroy
        data = Rental.find(params[:id])
        data.destroy
    end

    private

    def rental_params
        params.require(:rental).permit(:name, :checkout_date, :book_id, :stock)
    end

    def get_rental_and_book
        @book = Book.find(params[:book_id])
        @rental = Rental.new
    end
end