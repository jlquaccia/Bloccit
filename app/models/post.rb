class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }

  # Assignment 38 //////////////////////////

  def ordered_by_title
    scope { order('title') }
  end

  def ordered_by_reverse_created_at
    scope { order('created_at DESC') }
  end

  # /////////////////////////////////////////
end