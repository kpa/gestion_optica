class AddObservacionesToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :observaciones, :string
  end
end
