class AddPagesReadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pages_read, :integer
  end
end
