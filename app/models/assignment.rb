class Assignment < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  attr_accessible :body, :category, :cost, :instructions, :key_words, :language, :rating, :style, :title, :word_count

  default_scope order('created_at DESC')
end
