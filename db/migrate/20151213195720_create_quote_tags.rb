class CreateQuoteTags < ActiveRecord::Migration
  def change
    create_table :quote_tags do |t|
      t.integer :user_id
      t.integer :quote_id
      t.integer :tag_id
      t.boolean :confirmed?, default: false

      t.timestamps null: false
    end
  end
end
