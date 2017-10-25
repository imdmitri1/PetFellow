class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :count, default: 0
      t.string :likable_type
      t.integer :likable_id, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
