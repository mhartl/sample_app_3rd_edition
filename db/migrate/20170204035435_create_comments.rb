class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :micropost, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :picture

      t.timestamps null: false
    end
  end
end
