class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gander
      t.text :bio
      t.string :avtar

      t.timestamps
    end
  end
end
