class CreateMyFavorites < ActiveRecord::Migration
  def change
    create_table :my_favorites do |t|
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps null: false
    end
  end
end
