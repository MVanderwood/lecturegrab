class RemoveUserIdFromQuoteTag < ActiveRecord::Migration
  def change
    remove_column :quote_tags, :user_id, :integer
  end
end
