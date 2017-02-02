class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :text
    add_column :users, :age, :integer
    add_column :users, :nationality, :string
    add_column :users, :image, :string
  end
end
