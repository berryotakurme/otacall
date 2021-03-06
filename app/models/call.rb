class Call < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  attr_accessor :call_index
end
