class CreateDiscussionFollowers < ActiveRecord::Migration
  def change
    create_table :discussion_followers do |t|
      t.integer :follower_id
      t.integer :discussion_id

      t.timestamps null: false
    end
  end
end
