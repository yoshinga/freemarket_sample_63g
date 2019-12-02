class AddCardNumberTouUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card_number, :integer, null: false
    add_column :users, :month, :integer, null: false
    add_column :users, :year, :integer, null: false
    add_column :users, :code, :integer, null: false
  end
end
