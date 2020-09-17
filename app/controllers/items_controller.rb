class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(item_params)
  end

  def destroy
  end

end
