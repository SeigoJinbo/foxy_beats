class ChangeDateOfRentals < ActiveRecord::Migration[6.0]
  def change
    remove_column :rentals, :start_date
    remove_column :rentals, :end_date
    add_column :rentals, :start_date, :date
    add_column :rentals, :end_date, :date
  end
end
