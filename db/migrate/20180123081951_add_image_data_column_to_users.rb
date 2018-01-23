class AddImageDataColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_data, :text
  end
end
