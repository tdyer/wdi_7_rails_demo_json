class AuthorsController < ApplicationController
  # This controller uses jBuilder Templates


  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def create
    @author = Author.new(author_params)
      if @author.save
        render :show, status: :created, location: @author
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    end
  end

  def update
      if @author.update(author_params)
        render :show, status: :ok, location: @author
      else
        render json: @author.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @author.destroy
    head :no_content
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :birthdate, :email)
    end
end
