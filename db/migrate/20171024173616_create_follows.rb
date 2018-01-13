class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id, null: false
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end
end
