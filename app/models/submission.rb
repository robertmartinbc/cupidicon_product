class Submission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :writer
  attr_accessible :description
end
