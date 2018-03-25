class CreateDistances < ActiveRecord::Migration[5.1]
  def change
    create_table :distances do |t|
      t.string :origin
      t.string :destinatarie
      t.integer :distance

      t.timestamps
    end
  end
end
