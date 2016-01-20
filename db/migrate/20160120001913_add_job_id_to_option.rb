class AddJobIdToOption < ActiveRecord::Migration
  def change
    add_column :options, :job_id, :integer
  end
end
