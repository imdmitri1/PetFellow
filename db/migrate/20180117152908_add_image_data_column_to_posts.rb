class AddImageDataColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_data, :text
  end
end
