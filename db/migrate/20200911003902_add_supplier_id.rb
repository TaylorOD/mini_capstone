class AddSupplierId < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :inventory, :integer
  end
end
