class CreateSalesGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_groups do |t|

      t.timestamps
    end
  end
end
