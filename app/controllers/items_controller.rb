class ItemsController < ApplicationController
  before_action :set_item, only:[:show]
  
  def new
  end
  
  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to mypages_path
    else
      redirect_to "/items/#{@item.id}"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end