class ItemsController < ApplicationController
  before_action :set_item, only:[:show]
  before_action :set2_item, only:[:destroy]
  
  def new
  end
  
  def show
  end

  def destroy
    if set2_item.destroy
      redirect_to mypages_path
    else
      redirect_to "/items/#{@item.id}"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set2_item
    item = Item.find(params[:id])
  end

end