class AssociateCharacterToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :characters do |t|
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
