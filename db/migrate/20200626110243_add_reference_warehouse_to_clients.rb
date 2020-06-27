class AddReferenceWarehouseToClients < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :warehouse, foreign_key: true
  end
end
