class AddColumnToCostume < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :address, :string, squish: true
  end
end
