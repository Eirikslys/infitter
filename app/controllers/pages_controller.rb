class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def color
    @colors = Item.limit(9).pluck(:color)
  end

  def wardrobe
    @item = Item.last
    if params[:color]
      @color = params[:color]
    end
  end

  def category
    @item = Item.last
  end

end
