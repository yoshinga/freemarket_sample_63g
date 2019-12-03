class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(exhibit_item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def exhibit_item_params
    params.require(:item).permit(
      :item_name,
      :discription,
      :condition_id,
      :burden_id,
      :prefecture_id,
      :deliverydays_id,
      :price,
      images_attributes: [:url]
    )
  end

end 

