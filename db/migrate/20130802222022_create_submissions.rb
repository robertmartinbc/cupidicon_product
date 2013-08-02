class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :description
      t.references :writer
      t.references :assignment

      t.timestamps
    end
    add_index :submissions, :writer_id
    add_index :submissions, :assignment_id
  end
end
