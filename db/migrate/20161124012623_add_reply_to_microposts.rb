class AddReplyToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :in_reply_to, :integer
  end
end
