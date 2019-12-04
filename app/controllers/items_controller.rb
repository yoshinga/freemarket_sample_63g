class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy]
  
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

  def show
  end

  def destroy
    if @item.destroy
      redirect_to mypages_path
    else
      redirect_to item_path
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

  def set_item
    @item = Item.find(params[:id])
  end
  
end