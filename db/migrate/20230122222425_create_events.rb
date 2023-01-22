class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :description
      t.belongs_to :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
