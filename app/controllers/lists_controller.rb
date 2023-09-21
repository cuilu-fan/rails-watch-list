class ListsController < ApplicationController
  before_action :set_params, only: %i[show edit update and destroy]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_param)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: 422
    end
  end

  def show
    @movies = @list.movies
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def edit

  end

  def update
    @list.update(list_param)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def set_params
    @list = List.find(params[:id])
  end

  def list_param
    params.require(:list).permit(:name)
  end

end
