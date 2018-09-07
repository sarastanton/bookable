class RemoveReadStatusFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :read_status, :boolean
  end
end
