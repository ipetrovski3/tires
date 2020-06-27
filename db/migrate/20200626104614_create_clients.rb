class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :plate
      t.string :dimension
      t.string :brand
      t.string :qty
      t.string :location
      t.string :magacin_id

      t.timestamps
    end
  end
end
