class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :for_acting_as, default: 0
      t.integer :status, default: 0
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end

    change_table :characters do |t|
      t.belongs_to :profile, null: false, foreign_key: true
    end
  end
end
