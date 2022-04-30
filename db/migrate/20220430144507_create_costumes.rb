class CreateCostumes < ActiveRecord::Migration[6.1]
  def change
    create_table :costumes do |t|
      t.string :name
      t.text :descr
      t.float :price
      t.string :size
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
