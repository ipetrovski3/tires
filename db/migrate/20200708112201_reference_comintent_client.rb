class ReferenceComintentClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :comintent, foreign_key: true
  end
end
