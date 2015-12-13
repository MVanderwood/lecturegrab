class RemoveUserIdFromQuote < ActiveRecord::Migration
  def change
    remove_column :quotes, :user_id, :integer
  end
end
