class AddTextAndUserIdToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :textbody, :string
    add_column :comments, :user_id, :integer
  end

  def self.down
    remove_column :comments, :user_id
    remove_column :comments, :textbody
  end
end
