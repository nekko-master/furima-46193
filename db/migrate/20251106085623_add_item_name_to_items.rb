class AddItemNameToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :item_name, :string, null: false
    add_column :items, :explanation, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :shipping_fee_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :shipping_day_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end
