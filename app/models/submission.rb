class Submission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :writer, class_name: "User", foreign_key: :writer_id
  attr_accessible :description, :assignment_id
end
