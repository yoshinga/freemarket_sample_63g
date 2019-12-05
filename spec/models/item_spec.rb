require 'rails_helper'

describe Item do
  describe '#create' do
    it 'is destroy' do
      item = build(:item)
      item.images.create(url: 'https://www.trefac.jp/img/img_db/3039000401170184/w500/2018120322315218401.jpg')

      expect{ item.destroy }.to change{ Item.count }.by(-1)
    end
  end
end