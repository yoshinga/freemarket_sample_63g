class ViewController < ApplicationController

  def index
    @items = Item.all
  end

  private
 def view_params
  params.require().permit()
 end
end