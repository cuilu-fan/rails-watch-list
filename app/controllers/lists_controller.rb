class ListsController < ApplicationController
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
    @list = List.find(params[:id])
  end

  private

  def list_param
    params.require(:list).permit(:name)
  end

end
