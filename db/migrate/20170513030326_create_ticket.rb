class CreateTicket < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :nombre, null: false
      t.string :file_path, null: false
      t.integer :disponible, null: false
      t.integer :utilizados, default: 0
    end
  end
end
