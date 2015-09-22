class RenameTablesNames < ActiveRecord::Migration
  def change
    rename_table :clientes, :clients
    rename_table :ordenes_trabajo, :work_orders
  end
end
