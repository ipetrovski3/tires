class CommintentInfoTables < ActiveRecord::Migration[6.0]
  def change
    add_column :comintents, :phone, :string
    add_column :comintents, :email, :string
  end
end
