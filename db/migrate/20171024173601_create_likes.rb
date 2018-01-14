class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :count
      t.string :likable_type
      t.integer :likable_id, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
