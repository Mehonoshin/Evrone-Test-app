class Comment < ActiveRecord::Base
  validates :textbody, :presence => { :message => "Idiot!" }
  
  belongs_to :user
  belongs_to :post
end
