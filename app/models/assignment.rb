class Assignment < ActiveRecord::Base
  has_many :comments
  attr_accessible :body, :category, :cost, :instructions, :key_words, :language, :rating, :style, :title, :word_count
end
