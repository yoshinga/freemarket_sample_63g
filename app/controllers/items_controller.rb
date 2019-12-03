class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy]
  
  def new
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

  def set_item
    @item = Item.find(params[:id])
  end

end