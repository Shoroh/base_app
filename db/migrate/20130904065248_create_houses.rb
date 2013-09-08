class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 0

      t.timestamps
    end
  end
end
