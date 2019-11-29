class ViewController < ApplicationController

  def index
    @items = Item.all
    # @item = @items.images
  end

 private
 def view_params
  params.require(:user).permit()
 end
end