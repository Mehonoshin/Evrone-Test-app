class AddTagToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :tags, :string
  end

  def self.down
    remove_column :posts, :tags
  end
end
