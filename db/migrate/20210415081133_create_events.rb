class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :date
      t.string :location
      t.string :creator

      t.timestamps
    end
  end
end
