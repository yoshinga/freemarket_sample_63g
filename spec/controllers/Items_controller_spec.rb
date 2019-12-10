require 'rails_helper'

describe ItemsController do
  describe 'DELETE #destroy' do
    it "assigns the requested item to @item" do
      item = create(:item)
      delete :destroy, params: { id: item }
      expect(assigns(:item)).to eq item
    end 
    it "redirect the :index template" do
      item = create(:item)
      delete :destroy, params: { id: item }
      expect(response).to redirect_to root_path
    end
  end

  describe ItemsController do
    describe 'GET #show' do
      it "assigns the requested item to @item" do
        item = create(:item)
        get :show, params: { id: item }
        expect(assigns(:item)).to eq item
      end
      it "renders the :show template" do
        item = create(:item)
        get :show, params: { id:item }
        expect(response).to render_template :show
      end
    end
  end

  describe ItemsController do
    describe 'GET #index' do
      it "assigns the requested items to @items" do
        items = create_list(:item, 5)
        get :index
        expect(assigns(:items)).to eq items
      end 
      it "renders the :index template" do
        items = create_list(:item, 5)
        get :index
        expect(response).to render_template :index
      end
    end
  end
end