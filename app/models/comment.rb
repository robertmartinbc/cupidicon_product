class Comment < ActiveRecord::Base
  belongs_to :assignment
  attr_accessible :body
end
