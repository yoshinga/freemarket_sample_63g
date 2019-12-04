class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     "item_name",    null: false, add_index: true
      t.text       "discription",  null: false
      t.references "user",         foreign_key: true
    end
  end
end
