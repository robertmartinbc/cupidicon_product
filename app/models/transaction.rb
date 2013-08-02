class Transaction < ActiveRecord::Base
  attr_accessible :assignment_id, :transaction_type, :writer_id
end
