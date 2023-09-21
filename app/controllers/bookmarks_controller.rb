class BookmarksController < ApplicationController
  before_action :set_params, only: %i[show destroy]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def show
    @comment
  end

  def destroy
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def set_params
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
