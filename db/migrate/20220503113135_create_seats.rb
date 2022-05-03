class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :A1
      t.integer :A2
      t.integer :A3
      t.integer :A4
      t.integer :B1
      t.integer :B2
      t.integer :B3
      t.integer :B4
      t.integer :C1
      t.integer :C2
      t.integer :C3
      t.integer :C4
      t.integer :D1
      t.integer :D2
      t.integer :D3
      t.integer :D4

      t.timestamps
    end
  end
end
