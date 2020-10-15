class ItemsController < ApplicationController
  # added this skipping to spare some logging in during developement, this needs to go later.
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  include Pagy::Backend

  def index
    # added a sorting to make sure the most recently added items are displayed first .sort_by { |item| item.created_at }
    @items = current_user.items
    @items = @items.order(:created_at)
    @colors = @items.select(:color).pluck(:color).uniq
    @favorite_colors = @items.where(favorite:true).select(:color).pluck(:color).uniq

    if params[:favorite]
      @items = @items.where(favorite:true)
    end

    if params[:category]
      @category = Category.find_by_name(params[:category])
      @items = @items.where(category:@category)
    end

    @color = params[:color]
    if @color
      @items = @items.where(color:@color)
    end

    @pagy, @records = pagy(@items, link_extra: "data-remote ='true'")
    @item = @records.last
  end

  def show

    # if params[:color]
    #   @color = params[:color]
    #   category = Category.find_by_name(params[:category])
    #   @item = Item.where(color:@color, category:category)
    # end
    if params.has_key?(:outfit)
      @index = params[:index].to_i
      @outfit = params[:outfit].map { |id| Item.find(id)}
      @item = @outfit[@index]
    else
      @item = Item.find(params[:id])
      @outfit ? nil : @outfit = top_secret_matching_algorithm(@item)
      @index = @outfit.index(@item)
    end
    @ids = @outfit.map { |item|  item.id}
    @next = @index >= 3 ? 0 : @index + 1
    @prev = @index <= 0 ? 3 : @index - 1


  end

  def destroy
    @article = Item.find(params[:id])
    @article.destroy

    redirect_to items_path
  end


  def new
    @colors = current_user.items.limit(9).pluck(:color)
    @new_item = current_user.items.new
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    @item.update!(item_params)
    # will return to this later, see about adding an id and anchoring to it
    redirect_to items_path(category:@item.category.name, color:@item.color)
  end

  def create
    @new_item = current_user.items.new(item_params)
    @new_item.user = current_user
    @new_item.category = Category.find_by_name(category_param)
    if @new_item.save!
      redirect_to item_path(@new_item)
    else
      @colors = Item.limit(9).pluck(:color)
      render :new
    end
  end

  def color
    @item = current_user.items.find(params[:id])
  end

  private

  def top_secret_matching_algorithm(item)
    tops = Item.find_by(category:Category.find_by_name("tops"))
    bottoms = Item.find_by(category:Category.find_by_name("bottoms"))
    shoes = Item.find_by(category:Category.find_by_name("shoes"))
    accessories = Item.find_by(category:Category.find_by_name("accessories"))
    array = []
    [accessories, tops, bottoms, shoes].map do |i|
      i.category == item.category ? array << item : array << i
    end
    array
  end

# def top_secret_matching_algorithm(item)
#     tops = Item.find_by(category:Category.find_by_name("tops"))
#     bottoms = Item.find_by(category:Category.find_by_name("bottoms"))
#     shoes = Item.find_by(category:Category.find_by_name("shoes"))
#     accessories = Item.find_by(category:Category.find_by_name("accessories"))
#     array = [accessories, tops, bottoms, shoes]
#     carousel = []
#     [accessories, tops, bottoms, shoes].map do |i|
#       i.category == item.category ? carousel << item : carousel << i
#     end
#     array << item
#     raise
#   end
  def item_params
    params.require(:item).permit(:color, :image, :favorite, :name)
  end


  def category_param
    params.require(:item)[:category]
  end

end
