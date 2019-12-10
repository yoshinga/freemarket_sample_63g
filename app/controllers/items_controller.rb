class ItemsController < ApplicationController

before_action :set_item, only:[:show, :destroy, :edit, :update]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def purchase
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
    @random = Item.order("RAND()").limit(2).where.not(id: @item.id)
  end

  def edit
    
    # @image = exhibit_item_params[:images_attributes][:url]
    @images = @item.images
  
  end
  
  def update
    if @item.update(exhibit_item_params) 
      redirect_to root_path(@item)
    else
      render edit_item_path(@item)
    end
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
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def update_params
  #   @image = exhibit_item_params[:images_attributes][:url]
  # end

  
end

