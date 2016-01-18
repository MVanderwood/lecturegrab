class AddCompletionDateToUserLectures < ActiveRecord::Migration
  def change
    add_column :user_lectures, :completion_date, :datetime
  end
end
