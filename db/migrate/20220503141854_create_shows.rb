class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.timestamp :datetime
      t.references :movie, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
