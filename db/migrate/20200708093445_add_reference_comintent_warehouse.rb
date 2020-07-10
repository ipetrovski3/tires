class AddReferenceComintentWarehouse < ActiveRecord::Migration[6.0]
  def change
    add_reference :comintents, :warehouse, foreign_key: true
  end
end
