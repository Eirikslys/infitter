class ItemsController < ApplicationController
  # added this skipping to spare some logging in during developement, this needs to go later.
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    raise
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to item_path(@item)
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
    params.require(:item).permit(:category_id, :color, :image, :favorite, :name)
  end
end
