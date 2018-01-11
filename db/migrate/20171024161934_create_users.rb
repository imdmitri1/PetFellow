class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 64
      t.string :username, uniq: true, null: false, limit: 32
      t.text   :bio, limit: 512
      t.string :email, uniq: true, null: false, limit: 64
      t.string :hashed_password, null: false
      t.string :avatar

      t.timestamps
    end

  end
end
