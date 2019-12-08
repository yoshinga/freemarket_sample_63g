require 'rails_helper'

describe Item do

  describe '#create' do

    it "is valid with item_name, discription, burdern_id, prefecture_id, condition_id, price, deliverydays_id" do
      item = build(:item)
      expect(item).to be_valid
     end

    it "is invalid without a item_name" do
     item = build(:item, item_name: "")
     item.valid?
     expect(item.errors[:item_name]).to include("can't be blank")
    end

    it "is invalid without a discription" do
      item = build(:item, discription: "")
      item.valid?
      expect(item.errors[:discription]).to include("can't be blank")
     end

    it "is invalid without a burden_id" do
      item = build(:item, burden_id: "")
      item.valid?
      expect(item.errors[:burden_id]).to include("can't be blank")
    end
    
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a deliverydays_id" do
      item = build(:item, deliverydays_id: "")
      item.valid?
      expect(item.errors[:deliverydays_id]).to include("can't be blank")
    end

  end

end