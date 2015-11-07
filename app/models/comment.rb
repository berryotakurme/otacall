class Comment < ActiveRecord::Base
  belongs_to :call
  belongs_to :user
  attr_accessor :comment_index
end
