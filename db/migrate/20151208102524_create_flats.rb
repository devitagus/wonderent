class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.boolean :furnished
      t.boolean :kitchen
      t.integer :price

      t.timestamps null: false
    end
  end
end
