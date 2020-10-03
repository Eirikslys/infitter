class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end


  def wardrobe
    @item = Item.last
    if params[:color]
      @color = params[:color]
    end
  end



end
