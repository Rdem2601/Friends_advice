class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.text :review
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
