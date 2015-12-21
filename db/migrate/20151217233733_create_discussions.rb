class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :subject_id
      t.integer :owner_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
