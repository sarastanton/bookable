class AddValueToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :value, :integer
  end
end
