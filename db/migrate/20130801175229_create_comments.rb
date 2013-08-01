class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :assignment

      t.timestamps
    end
    add_index :comments, :assignment_id
  end
end
