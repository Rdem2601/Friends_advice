class AddDateToDestination < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :date, :string
  end
end
