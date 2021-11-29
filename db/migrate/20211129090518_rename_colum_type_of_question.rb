class RenameColumTypeOfQuestion < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :type, :typeQuestion
  end
end
