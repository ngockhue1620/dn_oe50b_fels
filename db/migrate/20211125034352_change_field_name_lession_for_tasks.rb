class ChangeFieldNameLessionForTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column  :tasks, :lessions_id, :lession_id
  end
end
