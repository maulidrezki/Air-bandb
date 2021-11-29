class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.float :price_per_night
      t.string :name
      t.string :location
      t.integer :capacity
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
