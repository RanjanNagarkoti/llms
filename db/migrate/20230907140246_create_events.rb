class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :status
      t.integer :visibility
      t.string :location
      t.references :type, null: false, foreign_key: true
      t.string :cover_image

      t.timestamps
    end
  end
end
