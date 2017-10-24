class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, limit: 512
      t.integer :post_id, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
