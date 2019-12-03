class ItemsController < ApplicationController
  before_action :set_item, only:[:show]

  def new
  end
  
  def show
  end

  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy
    rescue => e
      Rails.logger.debug e.message
    end
    redirect_to mypages_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end