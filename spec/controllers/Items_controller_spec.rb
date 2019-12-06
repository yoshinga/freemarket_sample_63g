require 'rails_helper'

describe ItemsController do
  describe 'DELETE #destroy' do
    it "assigns the requested item to @item" do
      item = create(:item)
      delete :destroy, params: { id: item }
      expect(assigns(:item)).to eq item
    end 
    it "redirect the :destroy template" do
      item = create(:item)
      delete :destroy, params: { id: item }
      expect(response).to redirect_to root_path
    end
  end
end