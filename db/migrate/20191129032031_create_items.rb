class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false, add_index: true
      t.text :discription, null: false
      # t.references :user, foreign_key: true
      # t.references :category, foreign_key: true
      # t.references :brand, foreign_key: true
      t.integer :burden_id, null: false #配送料の負担が出品者か購入者か分かるようにするためのカラム
      t.integer :prefecture_id, null: false
      t.integer :condition_id, null: false
      t.integer :price, null: false
      # t.integer :delivery_fee, null: false
      t.integer :deliverydays_id, null: false
      # t.string :items_status, null: false
      # t.references :buyer, foreign_key: true
      # t.references :seller, foreign_key: true
      # t.references :prefecture 


      t.timestamps
    end
    add_reference :items, :user, foreign_key: true
  end
end
