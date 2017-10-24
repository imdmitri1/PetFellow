class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content, limit: 512, null: false
      t.string :message_seen, default: "false"
      t.integer :author_id, null: false
      t.integer :receiver_id, null: false

      t.timestamps
    end
  end
end
