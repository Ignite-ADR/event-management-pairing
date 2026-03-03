class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :date, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
