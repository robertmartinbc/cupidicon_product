class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :word_count
      t.string :language
      t.string :rating
      t.text :key_words
      t.float :cost
      t.string :style
      t.text :instructions

      t.timestamps
    end
  end
end
