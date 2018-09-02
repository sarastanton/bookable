class AddReadStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :read_status, :boolean
  end
end
