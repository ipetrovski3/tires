class RemoveForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :clients, column: :warehouse_id
  end
end
