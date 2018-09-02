class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :book
    end
  end
end
