class RemoveInvetory < ActiveRecord::Migration[6.0]
  def change
    remove_column :suppliers, :inventory, :integer
    remove_column :products, :inventory, :integer

  end
end
