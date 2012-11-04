class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :post_id, :text, :post, :email

  validates_presence_of :post_id, :text, :email
  validates_format_of   :email, :with => /^[a-z0-9\-\.]+@[a-z0-9\-\.]+\.[a-z]{2,4}$/, :allow_blank => true

end
