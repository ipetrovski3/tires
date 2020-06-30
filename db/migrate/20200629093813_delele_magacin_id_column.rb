class DeleleMagacinIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :magacin_id
  end
end
