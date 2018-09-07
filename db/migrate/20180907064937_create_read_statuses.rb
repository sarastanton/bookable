class CreateReadStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :read_statuses do |t|
      t.boolean :value, default: false
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end
