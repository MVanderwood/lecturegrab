class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :user_id
      t.integer :subject_id
      t.datetime :delivery_time
      t.string :delivery_interval
      t.string :delivery_method

      t.timestamps null: false
    end
  end
end
