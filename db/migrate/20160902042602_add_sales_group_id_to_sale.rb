class AddSalesGroupIdToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :sales_group_id, :integer
  end
end
