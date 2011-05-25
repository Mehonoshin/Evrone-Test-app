class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_taggable_on :tags
  cattr_reader :per_page
  @@per_page = 5
end
