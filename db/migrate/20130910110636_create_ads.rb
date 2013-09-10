class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 8, scale: 0

      t.timestamps
    end
  end
end
