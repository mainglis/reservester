class StatusToPending < ActiveRecord::Migration
  def change
  	change_column :reservations, :status, :string, default: "pending"
  end
end
