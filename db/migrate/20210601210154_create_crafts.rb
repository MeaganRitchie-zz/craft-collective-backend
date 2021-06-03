class CreateCrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :crafts do |t|
      t.string :name
      t.string :description
      t.string :supplylist
      t.string :image
      t.references :user

      t.timestamps
    end
  end
end
