class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :post_id, :text, :post

  validates_presence_of :post_id, :text

end
