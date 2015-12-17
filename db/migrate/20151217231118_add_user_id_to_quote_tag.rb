class AddUserIdToQuoteTag < ActiveRecord::Migration
  def change
    add_column :quote_tags, :user_id, :integer
  end
end
