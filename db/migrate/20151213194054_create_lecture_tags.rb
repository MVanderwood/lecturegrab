class CreateLectureTags < ActiveRecord::Migration
  def change
    create_table :lecture_tags do |t|
      t.integer :lecture_id
      t.integer :tag_id
      t.integer :user_id
      t.boolean :confirmed?, default: false

      t.timestamps null: false
    end
  end
end
