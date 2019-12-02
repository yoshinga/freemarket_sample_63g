class ItemsController < ApplicationController

  def new
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy 
    redirect_to mypages_path
  end

end