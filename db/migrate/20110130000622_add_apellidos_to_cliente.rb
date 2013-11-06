class AddApellidosToCliente < ActiveRecord::Migration
  def self.up
    add_column :clientes, :apellidos, :string
  end

  def self.down
    remove_column :clientes, :apellidos
  end
end
