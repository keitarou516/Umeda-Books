class ReviewsController < ApplicationController

    def index
        @reviews = Review.where(params[:book_id]).includes(:book).page(params[:page]).per(5)
    end

    def new
        get_review_and_book
    end

    def create
        get_review_and_book
        data = Review.create(review_params)
        unless data.save
            render action: :new
        end
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to action: :index
    end

    private
    
    def review_params
        params.require(:review).permit(:name, :rate, :title, :text, :book_id)
    end

    def get_review_and_book
        @book = Book.find(params[:book_id])
        @review = Review.new
    end
end
