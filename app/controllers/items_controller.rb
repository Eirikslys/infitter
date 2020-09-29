class ItemsController < ApplicationController
  # added this skipping to spare some logging in during developement, this needs to go later.
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @items = Item.all
    @color = params[:color]
    if params[:category]
      @category = Category.find_by_name(params[:category])
      @items = @items.where(category:@category)
    end
    if @color
      @items = @items.where(color:@color)
    end
  end

  def show
    if params[:color]
      @color = params[:color]
      category = Category.find_by_name(params[:category])
      @item = Item.where(color:@color, category:category)
    end
  end

  def destroy
  end

  # def wardrobe
  #   @items = Item.find(params[:color])
  #   @items = @items.find(params[:category])
  # end

  def new
    @colors = Item.limit(9).pluck(:color)
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
      @colors = Item.limit(9).pluck(:color)
      render :new

    end
  end

   def color
    @item = Item.find(params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:category_id, :color, :image, :favorite, :name)
  end
end
