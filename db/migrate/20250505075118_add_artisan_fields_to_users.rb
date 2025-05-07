class AddArtisanFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :shop_name, :string
    add_column :users, :shop_description, :text
    add_column :users, :shop_address, :string
  end
end
