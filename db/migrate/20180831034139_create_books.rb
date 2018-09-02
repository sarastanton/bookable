class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_id
      t.string :genre_id
      t.integer :page_count
      t.boolean :read_status, :default => false

      t.timestamps
    end
  end
end
