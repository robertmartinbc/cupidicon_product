class Submissions < ActiveRecord::Base
  belongs_to :writer
  belongs_to :assignment
  attr_accessible :description
end
