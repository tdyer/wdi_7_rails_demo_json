class BooksController < ApplicationController
  # This controller uses built-in json rendering

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :json
  def index
    @books = Book.all
    # Somewhat faster for larger sets. Not needed most of the time
    render json: Oj.dump(@books.lightning, mode: :compat)
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render :show, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render :show, status: :ok, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :price, :author_id)
    end
end
