class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.belongs_to :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
