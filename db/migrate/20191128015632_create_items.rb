class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :price
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
