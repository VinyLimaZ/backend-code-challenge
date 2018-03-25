class ChangeDistanceToGapOnDistance < ActiveRecord::Migration[5.1]
  def change
    rename_column :distances, :distance, :gap
  end
end
