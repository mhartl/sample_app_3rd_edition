class CreateProfileMessages < ActiveRecord::Migration
  def change
    create_table :profile_messages do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
