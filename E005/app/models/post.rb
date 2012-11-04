class Post < ActiveRecord::Base
  has_many :comments

  attr_accessible :title, :text

  validates_presence_of :title, :text
end
