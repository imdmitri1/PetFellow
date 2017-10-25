class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description, limit: 512
      t.string :pic_link
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
