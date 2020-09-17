class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  @item = Item.find(params[:id])
  end

  def destroy
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :color)
  end
end
