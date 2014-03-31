class AddStatusToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :status, :string
  	add_index :reservations, :status
  end
end
