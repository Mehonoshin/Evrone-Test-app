class AddFieldsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :textbody, :string
    add_column :posts, :title, :string
    add_column :posts, :user_id, :integer
  end

  def self.down
    remove_column :posts, :user_id
    remove_column :posts, :title
    remove_column :posts, :textbody
  end
end
