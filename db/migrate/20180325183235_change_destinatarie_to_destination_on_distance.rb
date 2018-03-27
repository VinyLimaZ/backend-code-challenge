class ChangeDestinatarieToDestinationOnDistance < ActiveRecord::Migration[5.1]
  def change
    rename_column :distances, :destinatarie, :destination
  end
end
