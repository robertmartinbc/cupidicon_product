class Assignment < ActiveRecord::Base
  attr_accessible :body, :category, :cost, :instructions, :key_words, :language, :rating, :style, :title, :word_count
end
